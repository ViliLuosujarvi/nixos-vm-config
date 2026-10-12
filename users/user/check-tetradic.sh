#!/bin/sh
# Self-check for .config/kak/colors/account-tetradic.kak.
# Lives outside .config on purpose: common/config-files.nix symlinks every file
# under .config into ~/.config, and this is not a kakoune file.
#
# Proves the two claims the scheme makes:
#   1. the 12 accents sit on a square tetrad rooted at red (hues 0/90/180/270)
#   2. every accent is readable as code text on the black background (>= 3:1)
# Run it after changing any tone.
set -e
KAK="$(dirname "$0")/.config/kak/colors/account-tetradic.kak"

grep -oP "^declare-option str \K\S+ 'rgb:[0-9a-f]{6}'" "$KAK" | tr -d "'" | sed 's/rgb://' | awk '
function hex(s){return strtonum("0x" s)}
function lin(v){v=v/255; return (v<=0.03928)? v/12.92 : ((v+0.055)/1.055)^2.4}
BEGIN{ w["red"]=0; w["lime"]=90; w["cyan"]=180; w["viol"]=270 }
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
  if(fam=="") next
  off=hue-w[fam]; if(off<0)off=-off; if(off>180)off=360-off
  n++
  if(off>1){ printf "FAIL %s #%s hue %.0f, want %d\n",name,h,hue,w[fam]; bad++ }
  if(c<3.0){ printf "FAIL %s #%s contrast %.1f:1 on black, too dim\n",name,h,c; bad++ }
}
END{ if(bad) exit 1; printf "ok: %d accents on the square tetrad, all >= 3:1 on black\n",n }'

# Every face the startup scheme sets must be overridden, or old reds bleed
# through when :colorscheme account-tetradic is applied on top of account.kak.
LEFT=$(comm -23 \
  "$(F=$(mktemp); grep -oP '^set-face global \K\S+' "$(dirname "$0")/.config/kak/colors/account.kak" | sort -u >"$F"; echo "$F")" \
  "$(F=$(mktemp); grep -oP '^set-face global \K\S+' "$KAK" | sort -u >"$F"; echo "$F")")
[ -z "$LEFT" ] || { echo "FAIL faces not overridden, will bleed through:"; echo "$LEFT"; exit 1; }
echo "ok: every face in account.kak is overridden"

# No face may reference an undeclared option.
UNDEF=$(comm -23 \
  "$(F=$(mktemp); grep -oP '%opt\{\K[^}]+' "$KAK" | sort -u >"$F"; echo "$F")" \
  "$(F=$(mktemp); grep -oP '^declare-option str \K\S+' "$KAK" | sort -u >"$F"; echo "$F")")
[ -z "$UNDEF" ] || { echo "FAIL undeclared options: $UNDEF"; exit 1; }
echo "ok: every %opt{} resolves"
