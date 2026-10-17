#!/usr/bin/env bash
# Self-check for the kakoune colorschemes in .config/kak/colors.
# Lives outside .config on purpose: common/config-files.nix symlinks every file
# under .config into ~/.config, and this is not a kakoune file.
#
# Usage: ./check-colors.sh [scheme.kak ...]   (default: every account-*.kak)
#
# Each scheme declares its own expected geometry in a comment, e.g.
#   # check-hues: cyan=180 azure=210 blue=240 viol=270
# so one script serves the tetradic and analogous schemes both.
#
# Proves, per scheme:
#   1. every accent sits on the hue its name claims
#   2. every accent is readable as code text on black (>= 3:1)
#   3. every face the startup scheme sets is overridden (no colour bleeds through)
#   4. every %opt{} it references is declared
# Then checks the schemes are interchangeable: same face set, no shared option
# names (a duplicate declare-option aborts a file mid-switch).
set -e
cd "$(dirname "$0")/.config/kak/colors"
BASE=account.kak
if [ $# -gt 0 ]; then SCHEMES=""; for a in "$@"; do SCHEMES="$SCHEMES $(basename "$a")"; done; else SCHEMES=$(ls account-*.kak); fi
rc=0

for f in $SCHEMES; do
  echo "--- $f"
  grep -q "^# check-hues:" "$f" || { echo "FAIL no '# check-hues:' line"; rc=1; continue; }

  sed -n 's/^# check-hues: *//p' "$f" | tr ' ' '\n' > /tmp/.hues.$$
  grep -oP "^declare-option str \K\S+ 'rgb:[0-9a-f]{6}'" "$f" | tr -d "'" | sed 's/rgb://' \
  | awk -v huefile=/tmp/.hues.$$ '
    function hex(s){return strtonum("0x" s)}
    function lin(v){v=v/255; return (v<=0.03928)? v/12.92 : ((v+0.055)/1.055)^2.4}
    BEGIN{ while((getline l < huefile)>0){ split(l,p,"="); if(p[1]!="") w[p[1]]=p[2] } }
    {
      name=$1; h=$2
      r=hex(substr(h,1,2)); g=hex(substr(h,3,2)); b=hex(substr(h,5,2))
      max=(r>g?(r>b?r:b):(g>b?g:b)); min=(r<g?(r<b?r:b):(g<b?g:b)); d=max-min
      if(d==0) hue=0
      else if(max==r) hue=60*(((g-b)/d)%6)
      else if(max==g) hue=60*(((b-r)/d)+2)
      else hue=60*(((r-g)/d)+4)
      if(hue<0) hue+=360
      L=0.2126*lin(r)+0.7152*lin(g)+0.0722*lin(b); c=(L+0.05)/0.05
      fam=""; for(k in w) if(index(name,k)) fam=k
      if(fam=="") next            # neutral ramp claims no hue
      off=hue-w[fam]; if(off<0)off=-off; if(off>180)off=360-off
      n++
      if(off>1){ printf "FAIL %s #%s hue %.0f, name claims %d\n",name,h,hue,w[fam]; bad++ }
      if(c<3.0){ printf "FAIL %s #%s contrast %.1f:1 on black, too dim\n",name,h,c; bad++ }
    }
    END{ if(bad) exit 1; printf "  ok: %d accents on their declared hues, all >= 3:1 on black\n",n }' || rc=1
  rm -f /tmp/.hues.$$

  faces() { grep -oP '^set-face global \K\S+' "$1" | sort -u; }
  opts()  { grep -oP '%opt\{\K[^}]+' "$1" | sort -u; }
  decls() { grep -oP '^declare-option str \K\S+' "$1" | sort -u; }

  left=$(comm -23 <(faces $BASE) <(faces "$f"))
  [ -z "$left" ] && echo "  ok: every face in $BASE is overridden" \
                 || { echo "FAIL faces not overridden, will bleed through:"; echo "$left"; rc=1; }

  undef=$(comm -23 <(opts "$f") <(decls "$f"))
  [ -z "$undef" ] && echo "  ok: every %opt{} resolves" \
                  || { echo "FAIL undeclared options: $undef"; rc=1; }
done

echo "--- interchangeability"
set -- $SCHEMES
for a in $SCHEMES; do for b in $SCHEMES; do
  [ "$a" \< "$b" ] || continue
  d=$(comm -3 <(grep -oP '^set-face global \K\S+' $a | sort -u) \
              <(grep -oP '^set-face global \K\S+' $b | sort -u))
  [ -z "$d" ] || { echo "FAIL $a and $b set different faces:"; echo "$d"; rc=1; }
  s=$(comm -12 <(grep -oP '^declare-option str \K\S+' $a | sort -u) \
               <(grep -oP '^declare-option str \K\S+' $b | sort -u))
  [ -z "$s" ] || { echo "FAIL $a and $b share option names, switching aborts: $s"; rc=1; }
done; done
[ $rc -eq 0 ] && echo "  ok: schemes set identical face sets and share no option names"
exit $rc
