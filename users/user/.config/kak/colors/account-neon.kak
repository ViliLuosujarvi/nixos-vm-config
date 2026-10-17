# account-neon: the five-colour neon run, purple through orange.
#
# Switch to it at runtime with:   :colorscheme account-neon
#
# Option names are n_-prefixed so this file can coexist with account.kak
# (base00), account-analogous.kak (a_) and account-tetradic.kak (t_) - a second
# declare-option on a live name aborts the file, so all four stay mutually
# switchable.
#
# check-hues: purple=282 magenta=308 pink=327 red=359 orange=30

### The scheme ###
#
# Five given colours, each taking one job:
#
#   orange   hue  30   #ff8912   keywords, control flow, functions
#   magenta  hue 308   #f200d1   literals and data: strings, numbers, constants
#   pink     hue 327   #ff1b98   structure and identity: types, modules, markup
#   red      hue 359   #ff3c3f   diagnostics, danger, removal - nothing else
#   purple   hue 282   #b300ff   UI chrome: cursor, selection, search, prompt
#
# Orange is the loudest and the most frequent, so it carries control flow.
# Red is held out of syntax entirely: anything red is something wrong.
#
# Three tones per family, meaning the same thing in every family:
#
#   _v  vivid    the given colour, the headline member of the group
#   _l  light    a close relative, one step up
#   _m  muted    the supporting cast, present but quiet
#
# Plain text, identifiers, comments and punctuation stay on an untinted grey
# ramp. They are most of what is on screen, and keeping them neutral is what
# lets five saturated hues stay apart.
#
# Selection recolours the glyphs instead of painting a block behind them, so
# both selection faces set a foreground only - kakoune merges faces, so an
# omitted background is inherited from whatever is underneath. The cursor still
# inverts - a foreground-only cursor is invisible at end-of-line.
#
# Purple is the dimmest of the five (4.4:1 on black), so its muted tone is
# lighter than the vivid one rather than darker. Every accent clears 3:1.

# neutrals - plain grey ramp, no tint
declare-option str n_bg0 'rgb:000000'   # background
declare-option str n_bg1 'rgb:0d0d0d'   # darker variant: menus, info boxes
declare-option str n_bg2 'rgb:1f1f1f'   # layers: status line
declare-option str n_bg3 'rgb:363636'   # raised layer: padding, whitespace marks
declare-option str n_fg3 'rgb:7a7a7a'   # muted: comments, punctuation, line numbers
declare-option str n_fg2 'rgb:b8b8b8'   # secondary text
declare-option str n_fg1 'rgb:e0e0e0'   # main text, identifiers
declare-option str n_fg0 'rgb:fafafa'   # highlighted text

# orange - hue 30 - keywords, control flow, functions
# (brightened one step off the given #ff8912, which stays on as the muted tone)
declare-option str n_orange_v 'rgb:ffa141'
declare-option str n_orange_l 'rgb:ffca94'
declare-option str n_orange_m 'rgb:ff8912'

# magenta - hue 308 - literals and data
declare-option str n_magenta_v 'rgb:f200d1'
declare-option str n_magenta_l 'rgb:f285e3'
declare-option str n_magenta_m 'rgb:bd00a3'

# pink - hue 327 - structure and identity
declare-option str n_pink_v 'rgb:ff1b98'
declare-option str n_pink_l 'rgb:ff98d1'
declare-option str n_pink_m 'rgb:c71577'

# red - hue 359 - diagnostics, danger, removal
declare-option str n_red_v 'rgb:ff3c3f'
declare-option str n_red_l 'rgb:ffa7a9'
declare-option str n_red_m 'rgb:c72f31'

# purple - hue 282 - UI chrome (muted tone is lighter: purple is the dimmest hue)
declare-option str n_purple_v 'rgb:b300ff'
declare-option str n_purple_l 'rgb:dd8cff'
declare-option str n_purple_m 'rgb:be26ff'

# code

set-face global value "%opt{n_magenta_v}"
set-face global type "%opt{n_pink_v}"
set-face global variable "%opt{n_fg1}"
set-face global module "%opt{n_pink_m}"
set-face global function "%opt{n_orange_l}"
set-face global identifier "%opt{n_fg1}"
set-face global string "%opt{n_magenta_v}"
set-face global error "%opt{n_red_v}+b"
set-face global keyword "%opt{n_orange_v}+i"
set-face global operator "%opt{n_orange_m}"
set-face global attribute "%opt{n_pink_m}"
set-face global bracket "%opt{n_fg2}+b"
set-face global arguement "%opt{n_fg2}"
set-face global comma "%opt{n_fg3}"
set-face global constant "%opt{n_magenta_v}+b"
set-face global comment "%opt{n_fg3}+i"
set-face global documentation "%opt{n_fg3}+i"
set-face global docstring "%opt{n_magenta_m}+i"
set-face global meta "%opt{n_orange_m}"
set-face global builtin "%opt{n_orange_v}+b"

# text

set-face global title "%opt{n_pink_v}"
set-face global header "%opt{n_pink_l}"
set-face global bold "%opt{n_pink_l}+b"
set-face global italic "%opt{n_pink_l}+i"
set-face global mono "%opt{n_magenta_v}"
set-face global block "%opt{n_pink_m}"
set-face global link "%opt{n_pink_m}+u"
set-face global bullet "%opt{n_pink_m}"
set-face global list "%opt{n_fg1}"

# kakoune UI
#
# Chrome is purple and red only, so it can never be mistaken for a syntax
# token. Selections tint the text; only the cursor inverts.

set-face global Default "%opt{n_fg1},%opt{n_bg0}"
set-face global PrimarySelection "%opt{n_purple_l}"
set-face global SecondarySelection "%opt{n_purple_m}"
set-face global PrimaryCursor "%opt{n_bg0},%opt{n_purple_v}"
set-face global SecondaryCursor "%opt{n_bg0},%opt{n_purple_m}"
set-face global PrimaryCursorEol "%opt{n_bg0},%opt{n_purple_l}"
set-face global SecondaryCursorEol "%opt{n_bg0},%opt{n_purple_m}"
set-face global LineNumbers "%opt{n_fg3},%opt{n_bg0}"
set-face global LineNumberCursor "%opt{n_purple_l},%opt{n_bg0}+b"
set-face global LineNumbersWrapped "%opt{n_fg3},%opt{n_bg0}+i"
set-face global MenuForeground "%opt{n_purple_l},%opt{n_bg2}+b"
set-face global MenuBackground "%opt{n_fg2},%opt{n_bg1}"
set-face global MenuInfo "%opt{n_fg3},%opt{n_bg1}"
set-face global Information "%opt{n_fg1},%opt{n_bg2}"
set-face global Error "%opt{n_bg0},%opt{n_red_v}"
set-face global DiagnosticError "%opt{n_red_v}+b"
set-face global DiagnosticWarning "%opt{n_red_l}"
set-face global StatusLine "%opt{n_fg2},%opt{n_bg2}"
set-face global StatusLineMode "%opt{n_orange_v}+i"
set-face global StatusLineInfo "%opt{n_fg1},%opt{n_bg2}"
set-face global StatusLineValue "%opt{n_magenta_m},%opt{n_bg2}"
set-face global StatusCursor "%opt{n_bg0},%opt{n_purple_l}"
set-face global Prompt "%opt{n_purple_l},%opt{n_bg2}+b"
set-face global MatchingChar "%opt{n_purple_v},%opt{n_bg0}+b"
set-face global Whitespace "%opt{n_bg3},%opt{n_bg0}+f"
set-face global WrapMarker Whitespace
set-face global BufferPadding "%opt{n_bg3},%opt{n_bg0}"
set-face global Search "%opt{n_bg0},%opt{n_purple_l}"

# LSP / tree-sitter
#
# Same five families. Read down a group and the tones tell you the hierarchy:
# ts_keyword is vivid orange, its five conditional/directive relatives are the
# same orange one tone over, so they group on sight without blurring together.

# structure and identity - pink
set-face global ts_type                         "%opt{n_pink_v}"
set-face global ts_type_enum_variant            "%opt{n_pink_l}"
set-face global ts_constructor                  "%opt{n_pink_l}"
set-face global ts_namespace                    "%opt{n_pink_m}+i"
set-face global ts_attribute                    "%opt{n_pink_m}"
set-face global ts_property                     "%opt{n_pink_m}"
set-face global ts_tag                          "%opt{n_pink_v}"
set-face global ts_variable_other_member        "%opt{n_pink_m}"

# keywords, control flow, functions - orange
set-face global ts_keyword                      "%opt{n_orange_v}"
set-face global ts_keyword_conditional          "%opt{n_orange_l}+i"
set-face global ts_keyword_control_conditional  "%opt{n_orange_l}+i"
set-face global ts_keyword_control_directive    "%opt{n_orange_l}+i"
set-face global ts_keyword_control_import       "%opt{n_orange_l}+i"
set-face global ts_keyword_directive            "%opt{n_orange_l}+i"
set-face global ts_function                     "%opt{n_orange_l}"
set-face global ts_function_builtin             "%opt{n_orange_l}+i"
set-face global ts_function_macro               "%opt{n_orange_v}+b"
set-face global ts_constant_macro               "%opt{n_orange_v}+b"
set-face global ts_operator                     "%opt{n_orange_m}"
set-face global ts_label                        "%opt{n_orange_m}+i"
set-face global ts_special                      "%opt{n_orange_l}"
set-face global ts_hint                         "%opt{n_orange_v}+b"
set-face global ts_conceal                      "%opt{n_orange_m}+i"

# literals and data - magenta
set-face global ts_string                       "%opt{n_magenta_v}"
set-face global ts_string_regex                 "%opt{n_magenta_m}"
set-face global ts_string_regexp                "%opt{n_magenta_m}"
set-face global ts_string_escape                "%opt{n_magenta_l}+b"
set-face global ts_string_special               "%opt{n_magenta_l}"
set-face global ts_string_special_path          "%opt{n_magenta_l}+u"
set-face global ts_string_special_symbol        "%opt{n_magenta_l}"
set-face global ts_string_symbol                "%opt{n_magenta_l}"
set-face global ts_constant                     "%opt{n_magenta_v}+b"
set-face global ts_constant_builtin_boolean     "%opt{n_magenta_v}+b"
set-face global ts_constant_character           "%opt{n_magenta_l}"
set-face global ts_info                         "%opt{n_magenta_v}+b"

# diagnostics, danger, removal - red, and red appears nowhere else
set-face global ts_error                        "%opt{n_red_v}+b"
set-face global ts_tag_error                    "%opt{n_red_v}+b"
set-face global ts_warning                      "%opt{n_red_l}+b"
set-face global ts_spell                        "%opt{n_red_m}+u"

# diff: added is data (magenta), removed is danger (red), changed is structure (pink)
set-face global ts_diff_plus                    "%opt{n_magenta_v}"
set-face global ts_diff_minus                   "%opt{n_red_v}"
set-face global ts_diff_delta                   "%opt{n_pink_v}"
set-face global ts_diff_delta_moved             "%opt{n_pink_m}"

# markup: the heading levels are one tone ramp, pink fading into the neutrals
set-face global ts_markup_heading               "%opt{n_pink_v}+b"
set-face global ts_markup_heading_1             "%opt{n_pink_v}+b"
set-face global ts_markup_heading_2             "%opt{n_pink_l}+b"
set-face global ts_markup_heading_3             "%opt{n_pink_m}+b"
set-face global ts_markup_heading_4             "%opt{n_fg0}"
set-face global ts_markup_heading_5             "%opt{n_fg1}"
set-face global ts_markup_heading_6             "%opt{n_fg2}"
set-face global ts_markup_heading_marker        "%opt{n_pink_m}+b"
set-face global ts_markup_bold                  "%opt{n_pink_l}+b"
set-face global ts_markup_italic                "%opt{n_pink_l}+i"
set-face global ts_markup_link_label            "%opt{n_pink_v}"
set-face global ts_markup_link_text             "%opt{n_pink_l}"
set-face global ts_markup_link_url             "%opt{n_pink_m}+u"
set-face global ts_markup_link_uri              "%opt{n_pink_m}+u"
set-face global ts_markup_list_numbered         "%opt{n_pink_m}+i"
set-face global ts_markup_list_unnumbered       "%opt{n_pink_m}"
set-face global ts_markup_list_checked          "%opt{n_magenta_v}"
set-face global ts_markup_list_unchecked        "%opt{n_fg3}"
set-face global ts_markup_raw                   "%opt{n_magenta_m}"
set-face global ts_markup_quote                 "%opt{n_fg3}+i"
set-face global ts_markup_strikethrough         "%opt{n_red_m}+s"

# identifiers and plain text claim no hue
set-face global ts_text                         "%opt{n_fg1}"
set-face global ts_text_title                   "%opt{n_pink_v}+b"
set-face global ts_variable                     "%opt{n_fg1}"
set-face global ts_variable_builtin             "%opt{n_fg2}+i"
set-face global ts_variable_parameter           "%opt{n_fg2}+i"
set-face global ts_comment                      "%opt{n_fg3}+i"
set-face global ts_punctuation                  "%opt{n_fg3}"
set-face global ts_punctuation_special          "%opt{n_fg2}"
