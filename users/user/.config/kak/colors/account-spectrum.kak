# account-spectrum: the five-colour spectrum run, red through cyan.
#
# Switch to it at runtime with:   :colorscheme account-spectrum
#
# Option names are s_-prefixed so this file can coexist with account.kak
# (base00), account-analogous.kak (a_), account-tetradic.kak (t_) and
# account-neon.kak (n_) - a second declare-option on a live name aborts the
# file, so all five stay mutually switchable.
#
# check-hues: red=0 orange=18 yellow=52 green=141 cyan=182

### The scheme ###
#
# Five given colours, each taking one job:
#
#   yellow   hue  52   #ffe433   keywords, control flow, functions
#   green    hue 141   #00f556   literals and data: strings, numbers, constants
#   cyan     hue 182   #00f2fa   structure and identity: types, modules, markup
#   red      hue   0   #ee1717   diagnostics, danger, removal - nothing else
#   orange   hue  18   #fc6524   UI chrome: cursor, selection, search, prompt
#
# Yellow is the brightest of the five (16:1 on black), so it carries control
# flow - the most frequent thing on screen after plain text.
#
# Red is held out of syntax entirely: anything red is something wrong. Orange
# sits only 18 degrees from it, so orange is kept off text as well and used for
# chrome, where it shows up as an inverted block rather than as a glyph colour.
# That leaves the three families that do colour text - yellow, green, cyan -
# far apart in hue from the red that means "error".
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
# Selection recolours the glyphs instead of painting a block behind them: both
# selection faces set a foreground only - kakoune merges faces, so an omitted
# background is inherited from whatever is underneath. Each selection tone is
# the same colour as the matching cursor, so a selection reads as its cursor
# smeared across the range. The cursor still
# inverts, since a foreground-only cursor is invisible at end-of-line.
#
# Red is the dimmest of the five (4.8:1 on black), so its muted tone is only
# slightly darkened. Every accent clears 3:1.

# neutrals - plain grey ramp, no tint
declare-option str s_bg0 'rgb:000000'   # background
declare-option str s_bg1 'rgb:0d0d0d'   # darker variant: menus, info boxes
declare-option str s_bg2 'rgb:1f1f1f'   # layers: status line
declare-option str s_bg3 'rgb:363636'   # raised layer: padding, whitespace marks
declare-option str s_fg3 'rgb:7a7a7a'   # muted: comments, punctuation, line numbers
declare-option str s_fg2 'rgb:b8b8b8'   # secondary text
declare-option str s_fg1 'rgb:e0e0e0'   # main text, identifiers
declare-option str s_fg0 'rgb:fafafa'   # highlighted text

# yellow - hue 52 - keywords, control flow, functions
declare-option str s_yellow_v 'rgb:ffe433'
declare-option str s_yellow_l 'rgb:fff3a3'
declare-option str s_yellow_m 'rgb:c7b228'

# green - hue 141 - literals and data
declare-option str s_green_v 'rgb:00f556'
declare-option str s_green_l 'rgb:87f5ad'
declare-option str s_green_m 'rgb:00bf43'

# cyan - hue 182 - structure and identity
declare-option str s_cyan_v 'rgb:00f2fa'
declare-option str s_cyan_l 'rgb:8af6fa'
declare-option str s_cyan_m 'rgb:00bdc3'

# red - hue 0 - diagnostics, danger, removal (muted tone kept light: red is the dimmest hue)
declare-option str s_red_v 'rgb:ee1717'
declare-option str s_red_l 'rgb:ee8d8d'
declare-option str s_red_m 'rgb:cc1414'

# orange - hue 18 - UI chrome
declare-option str s_orange_v 'rgb:fc6524'
declare-option str s_orange_l 'rgb:fcb89b'
declare-option str s_orange_m 'rgb:c54f1c'

# code

set-face global value "%opt{s_green_v}"
set-face global type "%opt{s_cyan_v}"
set-face global variable "%opt{s_fg1}"
set-face global module "%opt{s_cyan_m}"
set-face global function "%opt{s_yellow_l}"
set-face global identifier "%opt{s_fg1}"
set-face global string "%opt{s_green_v}"
set-face global error "%opt{s_red_v}+b"
set-face global keyword "%opt{s_yellow_v}+i"
set-face global operator "%opt{s_yellow_m}"
set-face global attribute "%opt{s_cyan_m}"
set-face global bracket "%opt{s_fg2}+b"
set-face global arguement "%opt{s_fg2}"
set-face global comma "%opt{s_fg3}"
set-face global constant "%opt{s_green_v}+b"
set-face global comment "%opt{s_fg3}+i"
set-face global documentation "%opt{s_fg3}+i"
set-face global docstring "%opt{s_green_m}+i"
set-face global meta "%opt{s_yellow_m}"
set-face global builtin "%opt{s_yellow_v}+b"

# text

set-face global title "%opt{s_cyan_v}"
set-face global header "%opt{s_cyan_l}"
set-face global bold "%opt{s_cyan_l}+b"
set-face global italic "%opt{s_cyan_l}+i"
set-face global mono "%opt{s_green_v}"
set-face global block "%opt{s_cyan_m}"
set-face global link "%opt{s_cyan_m}+u"
set-face global bullet "%opt{s_cyan_m}"
set-face global list "%opt{s_fg1}"

# kakoune UI
#
# Chrome is orange and red only, so it can never be mistaken for a syntax
# token. Selections tint the text; only the cursor inverts.

set-face global Default "%opt{s_fg1},%opt{s_bg0}"
set-face global PrimarySelection "%opt{s_orange_v}"
set-face global SecondarySelection "%opt{s_orange_m}"
set-face global PrimaryCursor "%opt{s_bg0},%opt{s_orange_v}"
set-face global SecondaryCursor "%opt{s_bg0},%opt{s_orange_m}"
set-face global PrimaryCursorEol "%opt{s_bg0},%opt{s_orange_l}"
set-face global SecondaryCursorEol "%opt{s_bg0},%opt{s_orange_m}"
set-face global LineNumbers "%opt{s_fg3},%opt{s_bg0}"
set-face global LineNumberCursor "%opt{s_orange_l},%opt{s_bg0}+b"
set-face global LineNumbersWrapped "%opt{s_fg3},%opt{s_bg0}+i"
set-face global MenuForeground "%opt{s_orange_l},%opt{s_bg2}+b"
set-face global MenuBackground "%opt{s_fg2},%opt{s_bg1}"
set-face global MenuInfo "%opt{s_fg3},%opt{s_bg1}"
set-face global Information "%opt{s_fg1},%opt{s_bg2}"
set-face global Error "%opt{s_bg0},%opt{s_red_v}"
set-face global DiagnosticError "%opt{s_red_v}+b"
set-face global DiagnosticWarning "%opt{s_red_l}"
set-face global StatusLine "%opt{s_fg2},%opt{s_bg2}"
set-face global StatusLineMode "%opt{s_yellow_v}+i"
set-face global StatusLineInfo "%opt{s_fg1},%opt{s_bg2}"
set-face global StatusLineValue "%opt{s_green_m},%opt{s_bg2}"
set-face global StatusCursor "%opt{s_bg0},%opt{s_orange_l}"
set-face global Prompt "%opt{s_orange_l},%opt{s_bg2}+b"
set-face global MatchingChar "%opt{s_orange_v},%opt{s_bg0}+b"
set-face global Whitespace "%opt{s_bg3},%opt{s_bg0}+f"
set-face global WrapMarker Whitespace
set-face global BufferPadding "%opt{s_bg3},%opt{s_bg0}"
set-face global Search "%opt{s_bg0},%opt{s_orange_l}"

# LSP / tree-sitter
#
# Same five families. Read down a group and the tones tell you the hierarchy:
# ts_keyword is vivid yellow, its five conditional/directive relatives are the
# same yellow one tone over, so they group on sight without blurring together.

# structure and identity - cyan
set-face global ts_type                         "%opt{s_cyan_v}"
set-face global ts_type_enum_variant            "%opt{s_cyan_l}"
set-face global ts_constructor                  "%opt{s_cyan_l}"
set-face global ts_namespace                    "%opt{s_cyan_m}+i"
set-face global ts_attribute                    "%opt{s_cyan_m}"
set-face global ts_property                     "%opt{s_cyan_m}"
set-face global ts_tag                          "%opt{s_cyan_v}"
set-face global ts_variable_other_member        "%opt{s_cyan_m}"

# keywords, control flow, functions - yellow
set-face global ts_keyword                      "%opt{s_yellow_v}"
set-face global ts_keyword_conditional          "%opt{s_yellow_l}+i"
set-face global ts_keyword_control_conditional  "%opt{s_yellow_l}+i"
set-face global ts_keyword_control_directive    "%opt{s_yellow_l}+i"
set-face global ts_keyword_control_import       "%opt{s_yellow_l}+i"
set-face global ts_keyword_directive            "%opt{s_yellow_l}+i"
set-face global ts_function                     "%opt{s_yellow_l}"
set-face global ts_function_builtin             "%opt{s_yellow_l}+i"
set-face global ts_function_macro               "%opt{s_yellow_v}+b"
set-face global ts_constant_macro               "%opt{s_yellow_v}+b"
set-face global ts_operator                     "%opt{s_yellow_m}"
set-face global ts_label                        "%opt{s_yellow_m}+i"
set-face global ts_special                      "%opt{s_yellow_l}"
set-face global ts_hint                         "%opt{s_yellow_v}+b"
set-face global ts_conceal                      "%opt{s_yellow_m}+i"

# literals and data - green
set-face global ts_string                       "%opt{s_green_v}"
set-face global ts_string_regex                 "%opt{s_green_m}"
set-face global ts_string_regexp                "%opt{s_green_m}"
set-face global ts_string_escape                "%opt{s_green_l}+b"
set-face global ts_string_special               "%opt{s_green_l}"
set-face global ts_string_special_path          "%opt{s_green_l}+u"
set-face global ts_string_special_symbol        "%opt{s_green_l}"
set-face global ts_string_symbol                "%opt{s_green_l}"
set-face global ts_constant                     "%opt{s_green_v}+b"
set-face global ts_constant_builtin_boolean     "%opt{s_green_v}+b"
set-face global ts_constant_character           "%opt{s_green_l}"
set-face global ts_info                         "%opt{s_green_v}+b"

# diagnostics, danger, removal - red, and red appears nowhere else
set-face global ts_error                        "%opt{s_red_v}+b"
set-face global ts_tag_error                    "%opt{s_red_v}+b"
set-face global ts_warning                      "%opt{s_red_l}+b"
set-face global ts_spell                        "%opt{s_red_m}+u"

# diff: added is data (green), removed is danger (red), changed is structure (cyan)
set-face global ts_diff_plus                    "%opt{s_green_v}"
set-face global ts_diff_minus                   "%opt{s_red_v}"
set-face global ts_diff_delta                   "%opt{s_cyan_v}"
set-face global ts_diff_delta_moved             "%opt{s_cyan_m}"

# markup: the heading levels are one tone ramp, cyan fading into the neutrals
set-face global ts_markup_heading               "%opt{s_cyan_v}+b"
set-face global ts_markup_heading_1             "%opt{s_cyan_v}+b"
set-face global ts_markup_heading_2             "%opt{s_cyan_l}+b"
set-face global ts_markup_heading_3             "%opt{s_cyan_m}+b"
set-face global ts_markup_heading_4             "%opt{s_fg0}"
set-face global ts_markup_heading_5             "%opt{s_fg1}"
set-face global ts_markup_heading_6             "%opt{s_fg2}"
set-face global ts_markup_heading_marker        "%opt{s_cyan_m}+b"
set-face global ts_markup_bold                  "%opt{s_cyan_l}+b"
set-face global ts_markup_italic                "%opt{s_cyan_l}+i"
set-face global ts_markup_link_label            "%opt{s_cyan_v}"
set-face global ts_markup_link_text             "%opt{s_cyan_l}"
set-face global ts_markup_link_url             "%opt{s_cyan_m}+u"
set-face global ts_markup_link_uri              "%opt{s_cyan_m}+u"
set-face global ts_markup_list_numbered         "%opt{s_cyan_m}+i"
set-face global ts_markup_list_unnumbered       "%opt{s_cyan_m}"
set-face global ts_markup_list_checked          "%opt{s_green_v}"
set-face global ts_markup_list_unchecked        "%opt{s_fg3}"
set-face global ts_markup_raw                   "%opt{s_green_m}"
set-face global ts_markup_quote                 "%opt{s_fg3}+i"
set-face global ts_markup_strikethrough         "%opt{s_red_m}+s"

# identifiers and plain text claim no hue
set-face global ts_text                         "%opt{s_fg1}"
set-face global ts_text_title                   "%opt{s_cyan_v}+b"
set-face global ts_variable                     "%opt{s_fg1}"
set-face global ts_variable_builtin             "%opt{s_fg2}+i"
set-face global ts_variable_parameter           "%opt{s_fg2}+i"
set-face global ts_comment                      "%opt{s_fg3}+i"
set-face global ts_punctuation                  "%opt{s_fg3}"
set-face global ts_punctuation_special          "%opt{s_fg2}"
