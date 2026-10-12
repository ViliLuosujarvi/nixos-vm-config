# Reorganizing `system/` — handoff

Status: **evaluation done, nothing changed, route not yet chosen.** Ask the user
which route (A / B / C below) before editing. Do not commit unless asked.

## Goal

`system/` has one file per section (6 files). The user wants it compacted and
the file names to make sense. The user's three ideas and the verdict on each:

| Idea | Verdict |
|---|---|
| Convert `aliases.nix` into `git-aliases.zsh` | **Not as stated.** `git-aliases.zsh` already exists and is sourced. `aliases.nix` is the whole shell config (nix aliases using `${flakeDir}`, `programs.fzf`, `lsd`, zsh history/compinit, and the `source` lines for the `.zsh` files). It can't become plain `.zsh` without passing `flakeDir` another way. The real problem is its misleading name. |
| Move `pentest.nix` out of `system/`, e.g. next to the pentest user | **Not under `users/pentest/`.** See security constraint below. A sibling folder outside the ACL is fine. |
| Put user creation into `flake.nix` | **Advised against.** `flake.nix` is pure wiring (inputs, `homeFor`, module list). `pentest` is more than a user block (wireshark, capability wrappers, openvpn plugin). |

## Current layout (`system/`)

| File | Lines | Contents |
|---|---|---|
| `configuration.nix` | 132 | boot, nix, networking, **`user` account**, shared-checkout tmpfiles ACL + git safe.directory, first-boot clone service, ly, sway, pipewire, packages, stateVersion |
| `aliases.nix` | 145 | `environment.shellAliases` (nrs/nrt/nrb/hms/nfu/nup/c/ls/…), `programs.fzf`, `lsd`, `programs.zsh.*` (history, compinit -C, ngc/nix-delete-all-generations, plugin ordering, promptInit) |
| `pentest.nix` | 50 | **`pentest` account** (not in wheel), `programs.wireshark`, `security.wrappers` for nmap/tcpdump, `networkmanager-openvpn` |
| `git-aliases.zsh` | 234 | git aliases, sourced from `aliases.nix` |
| `completion.zsh` | 63 | completion + autosuggest settings, sourced from `aliases.nix` (`lib.mkOrder 2000`) |
| `prompt.zsh` | 119 | prompt, sourced from `aliases.nix` via `promptInit` |

`flake.nix` imports the three `.nix` files in `nixosConfigurations.nixos-vm.modules`
and passes `specialArgs.flakeDir = "/srv/nixos-vm-config"`.

## Security constraint (do not violate)

`configuration.nix` grants `pentest` rwX via ACL on `${flakeDir}/users/pentest`
only. `flake.nix` states root must **never** import anything under
`users/pentest`: pentest can write there, so root evaluating it hands pentest
root. Any system module (user creation, `security.wrappers`, wireshark) must
live **outside** `users/pentest/`. Keep the comment in `flake.nix` accurate
after any move.

## Routes

- **A. Minimal (recommended base).**
  1. `git mv system/aliases.nix system/shell.nix`
  2. `mkdir system/zsh && git mv system/{git-aliases,completion,prompt}.zsh system/zsh/`
  3. In `shell.nix`, change `${./git-aliases.zsh}` → `${./zsh/git-aliases.zsh}`, same for `completion.zsh` and `prompt.zsh`.
  4. Update `flake.nix` module list (`./system/shell.nix`) and the comment on line 41.
  5. Fix the comments listed under "References to update".
  Result: `system/` = `configuration.nix`, `shell.nix`, `pentest.nix`, `zsh/`.
  Keeps the one-line toggle to drop the pentest account.
- **B. A + merge accounts.** Also create `system/users.nix` containing both
  `users.users.user` (cut from `configuration.nix`) and `users.users.pentest`
  (cut from `pentest.nix`), plus `programs.zsh.enable`. Keep wireshark,
  wrappers and openvpn either in `pentest.nix` or in `users.nix`. Pentest toggle
  becomes "delete a block" if pentest.nix is folded in; update the header
  comment accordingly.
- **C. Fewest files.** A + fold `pentest.nix` into `configuration.nix`
  (~180 lines). Not recommended: loses the clean toggle and mixes the
  security-sensitive wrappers into the general file.

Recommendation: **A, optionally B.** Skip C and the `flake.nix` idea.

## References to update after any move

- `flake.nix:41` comment ("system/configuration.nix and aliases.nix")
- `flake.nix:44-46` module paths
- `common/home.nix:47` comment mentions `system/aliases.nix`
- `users/pentest/home.nix:8` and `:29` mention `system/pentest.nix`
- Header comments in `system/git-aliases.zsh:3`, `system/prompt.zsh:1`,
  `system/completion.zsh:2` ("Sourced from aliases.nix")
- `README.md:85` mentions `system/configuration.nix` (still valid under A/B)
- Comment in `system/aliases.nix` line ~23 refers to `configuration.nix`

## Verify after editing

Not yet run; the build was never tested during evaluation.

```sh
cd /srv/nixos-vm-config
nixos-rebuild build --flake .#nixos-vm --impure   # same as alias `nrb`
nix flake check --no-build --impure               # optional
home-manager build --flake .#user && home-manager build --flake .#pentest
```

`--impure` is required because `configuration.nix` imports
`/etc/nixos/hardware-configuration.nix`. `nrs` needs sudo; leave switching to
the user.

## Unchecked

- Whether the three `.zsh` files rely on being in the same directory as
  `aliases.nix` beyond the `source ${./…}` lines (grep showed only comments).
- No build or evaluation was run.
