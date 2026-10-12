# account-tetradic: square tetrad rooted at red.
#
# Switch to it at runtime with:   :colorscheme account-tetradic
# (kakrc sources account.kak at startup; this file overrides every face it sets.)
#
# Option names are t_-prefixed because account.kak already declared base00..base0F
# and a second declare-option on the same name aborts the file.

### The scheme ###
#
# Four hues, 90 degrees apart on the wheel, red as the anchor:
#
#   red     hue   0   diagnostics, danger, removal
#   lime    hue  90   literals and data: strings, numbers, constants
#   cyan    hue 180   structure and identity: types, modules, markup skeleton
#   violet  hue 270   control and action: keywords, functions, operators
#
# Each hue carries three tones, and the tone means the same thing in every hue,
# so related faces share a hue and differ only by tone:
#
#   _v  vivid    the headline member of the group
#   _l  light    a close relative of the headline member
#   _m  muted    the supporting cast, present but quiet
#
# Identifiers, comments and punctuation deliberately claim no hue - they are the
# most common tokens on screen, and leaving them on the neutral ramp is what lets
# the four families stay legible.

# neutrals (red-tinted darks: the scheme keeps its red root in the background)
declare-option str t_bg0 'rgb:000000'   # background
declare-option str t_bg1 'rgb:120707'   # darker variant: menus, info boxes
declare-option str t_bg2 'rgb:2b1515'   # layers: status line, selections
declare-option str t_bg3 'rgb:4a2a2a'   # raised layer: padding, whitespace marks
declare-option str t_fg3 'rgb:8a6060'   # muted: comments, punctuation, line numbers
declare-option str t_fg2 'rgb:c9b5b5'   # secondary text
declare-option str t_fg1 'rgb:e8dcdc'   # main text, identifiers
declare-option str t_fg0 'rgb:fff8f8'   # highlighted text

# red - hue 0 - diagnostics, danger, removal
declare-option str t_red_v 'rgb:ff4d4d'
declare-option str t_red_l 'rgb:ffb3b3'
declare-option str t_red_m 'rgb:cc7a7a'

# lime - hue 90 - literals and data
declare-option str t_lime_v 'rgb:a6ff4d'
declare-option str t_lime_l 'rgb:d9ffb3'
declare-option str t_lime_m 'rgb:a3cc7a'

# cyan - hue 180 - structure and identity
declare-option str t_cyan_v 'rgb:4dffff'
declare-option str t_cyan_l 'rgb:b3ffff'
declare-option str t_cyan_m 'rgb:7acccc'

# violet - hue 270 - control and action
declare-option str t_viol_v 'rgb:a64dff'
declare-option str t_viol_l 'rgb:d9b3ff'
declare-option str t_viol_m 'rgb:a37acc'

# code

set-face global value "%opt{t_lime_v}"
set-face global type "%opt{t_cyan_v}"
set-face global variable "%opt{t_fg1}"
set-face global module "%opt{t_cyan_m}"
set-face global function "%opt{t_viol_l}"
set-face global identifier "%opt{t_fg1}"
set-face global string "%opt{t_lime_v}"
set-face global error "%opt{t_red_v}"
set-face global keyword "%opt{t_viol_v}+i"
set-face global operator "%opt{t_viol_m}"
set-face global attribute "%opt{t_cyan_m}"
set-face global bracket "%opt{t_fg2}+b"
set-face global arguement "%opt{t_fg2}"
set-face global comma "%opt{t_fg3}"
set-face global constant "%opt{t_lime_v}+b"
set-face global comment "%opt{t_fg3}+i"
set-face global documentation "%opt{t_fg3}+i"
set-face global docstring "%opt{t_lime_m}+i"
set-face global meta "%opt{t_viol_m}"
set-face global builtin "%opt{t_viol_v}+b"

# text

set-face global title "%opt{t_cyan_v}"
set-face global header "%opt{t_cyan_l}"
set-face global bold "%opt{t_cyan_l}+b"
set-face global italic "%opt{t_cyan_l}+i"
set-face global mono "%opt{t_lime_v}"
set-face global block "%opt{t_cyan_m}"
set-face global link "%opt{t_cyan_m}+u"
set-face global bullet "%opt{t_cyan_m}"
set-face global list "%opt{t_fg1}"

# kakoune UI
#
# The UI stays on the neutral ramp, with red reserved for the cursor and errors.
# Nothing here reuses lime, cyan or violet, so UI chrome can never be mistaken
# for a syntax token.

set-face global Default "%opt{t_fg1},%opt{t_bg0}"
set-face global PrimarySelection "%opt{t_fg0},%opt{t_bg2}"
set-face global SecondarySelection "%opt{t_fg2},%opt{t_bg1}"
set-face global PrimaryCursor "%opt{t_bg0},%opt{t_red_v}"
set-face global SecondaryCursor "%opt{t_bg0},%opt{t_red_m}"
set-face global PrimaryCursorEol "%opt{t_bg0},%opt{t_red_l}"
set-face global SecondaryCursorEol "%opt{t_bg0},%opt{t_red_m}"
set-face global LineNumbers "%opt{t_fg3},%opt{t_bg0}"
set-face global LineNumberCursor "%opt{t_red_l},%opt{t_bg0}+b"
set-face global LineNumbersWrapped "%opt{t_fg3},%opt{t_bg0}+i"
set-face global MenuForeground "%opt{t_fg0},%opt{t_bg2}+b"
set-face global MenuBackground "%opt{t_fg2},%opt{t_bg1}"
set-face global MenuInfo "%opt{t_fg3},%opt{t_bg1}"
set-face global Information "%opt{t_fg1},%opt{t_bg2}"
set-face global Error "%opt{t_bg0},%opt{t_red_v}"
set-face global DiagnosticError "%opt{t_red_v}"
set-face global DiagnosticWarning "%opt{t_red_l}"
set-face global StatusLine "%opt{t_fg2},%opt{t_bg2}"
set-face global StatusLineMode "%opt{t_viol_v}+i"
set-face global StatusLineInfo "%opt{t_fg1},%opt{t_bg2}"
set-face global StatusLineValue "%opt{t_lime_m},%opt{t_bg2}"
set-face global StatusCursor "%opt{t_bg0},%opt{t_fg1}"
set-face global Prompt "%opt{t_fg0},%opt{t_bg2}+b"
set-face global MatchingChar "%opt{t_cyan_v},%opt{t_bg0}+b"
set-face global Whitespace "%opt{t_bg3},%opt{t_bg0}+f"
set-face global WrapMarker Whitespace
set-face global BufferPadding "%opt{t_bg3},%opt{t_bg0}"
set-face global Search "%opt{t_bg0},%opt{t_lime_l}"

# LSP / tree-sitter
#
# Same four families. Read down a group and the tones tell you the hierarchy:
# ts_keyword is vivid violet, its five conditional/directive relatives are the
# same violet one tone over, so they group on sight without blurring together.

# structure and identity - cyan
set-face global ts_type                         "%opt{t_cyan_v}"
set-face global ts_type_enum_variant            "%opt{t_cyan_l}"
set-face global ts_constructor                  "%opt{t_cyan_l}"
set-face global ts_namespace                    "%opt{t_cyan_m}+i"
set-face global ts_attribute                    "%opt{t_cyan_m}"
set-face global ts_property                     "%opt{t_cyan_m}"
set-face global ts_tag                          "%opt{t_cyan_v}"
set-face global ts_variable_other_member        "%opt{t_cyan_m}"

# control and action - violet
set-face global ts_keyword                      "%opt{t_viol_v}"
set-face global ts_keyword_conditional          "%opt{t_viol_l}+i"
set-face global ts_keyword_control_conditional  "%opt{t_viol_l}+i"
set-face global ts_keyword_control_directive    "%opt{t_viol_l}+i"
set-face global ts_keyword_control_import       "%opt{t_viol_l}+i"
set-face global ts_keyword_directive            "%opt{t_viol_l}+i"
set-face global ts_function                     "%opt{t_viol_l}"
set-face global ts_function_builtin             "%opt{t_viol_l}+i"
set-face global ts_function_macro               "%opt{t_viol_v}+b"
set-face global ts_constant_macro               "%opt{t_viol_v}+b"
set-face global ts_operator                     "%opt{t_viol_m}"
set-face global ts_label                        "%opt{t_viol_m}+i"
set-face global ts_special                      "%opt{t_viol_l}"
set-face global ts_hint                         "%opt{t_viol_v}+b"
set-face global ts_conceal                      "%opt{t_viol_m}+i"

# literals and data - lime
set-face global ts_string                       "%opt{t_lime_v}"
set-face global ts_string_regex                 "%opt{t_lime_m}"
set-face global ts_string_regexp                "%opt{t_lime_m}"
set-face global ts_string_escape                "%opt{t_lime_l}+b"
set-face global ts_string_special               "%opt{t_lime_l}"
set-face global ts_string_special_path          "%opt{t_lime_l}+u"
set-face global ts_string_special_symbol        "%opt{t_lime_l}"
set-face global ts_string_symbol                "%opt{t_lime_l}"
set-face global ts_constant                     "%opt{t_lime_v}+b"
set-face global ts_constant_builtin_boolean     "%opt{t_lime_v}+b"
set-face global ts_constant_character           "%opt{t_lime_l}"
set-face global ts_info                         "%opt{t_lime_v}+b"

# diagnostics, danger, removal - red
set-face global ts_error                        "%opt{t_red_v}+b"
set-face global ts_tag_error                    "%opt{t_red_v}+b"
set-face global ts_warning                      "%opt{t_red_l}+b"
set-face global ts_spell                        "%opt{t_red_m}+u"

# diff: added is data (lime), removed is danger (red), changed is structure (cyan)
set-face global ts_diff_plus                    "%opt{t_lime_v}"
set-face global ts_diff_minus                   "%opt{t_red_v}"
set-face global ts_diff_delta                   "%opt{t_cyan_v}"
set-face global ts_diff_delta_moved             "%opt{t_cyan_m}"

# markup: the heading levels are one tone ramp, cyan fading into the neutrals
set-face global ts_markup_heading               "%opt{t_cyan_v}+b"
set-face global ts_markup_heading_1             "%opt{t_cyan_v}+b"
set-face global ts_markup_heading_2             "%opt{t_cyan_l}+b"
set-face global ts_markup_heading_3             "%opt{t_cyan_m}+b"
set-face global ts_markup_heading_4             "%opt{t_fg0}"
set-face global ts_markup_heading_5             "%opt{t_fg1}"
set-face global ts_markup_heading_6             "%opt{t_fg2}"
set-face global ts_markup_heading_marker        "%opt{t_cyan_m}+b"
set-face global ts_markup_bold                  "%opt{t_cyan_l}+b"
set-face global ts_markup_italic                "%opt{t_cyan_l}+i"
set-face global ts_markup_link_label            "%opt{t_cyan_v}"
set-face global ts_markup_link_text             "%opt{t_cyan_l}"
set-face global ts_markup_link_url              "%opt{t_cyan_m}+u"
set-face global ts_markup_link_uri              "%opt{t_cyan_m}+u"
set-face global ts_markup_list_numbered         "%opt{t_cyan_m}+i"
set-face global ts_markup_list_unnumbered       "%opt{t_cyan_m}"
set-face global ts_markup_list_checked          "%opt{t_lime_v}"
set-face global ts_markup_list_unchecked        "%opt{t_fg3}"
set-face global ts_markup_raw                   "%opt{t_lime_m}"
set-face global ts_markup_quote                 "%opt{t_fg3}+i"
set-face global ts_markup_strikethrough         "%opt{t_red_m}+s"

# identifiers and plain text claim no hue
set-face global ts_text                         "%opt{t_fg1}"
set-face global ts_text_title                   "%opt{t_cyan_v}+b"
set-face global ts_variable                     "%opt{t_fg1}"
set-face global ts_variable_builtin             "%opt{t_fg2}+i"
set-face global ts_variable_parameter           "%opt{t_fg2}+i"
set-face global ts_comment                      "%opt{t_fg3}+i"
set-face global ts_punctuation                  "%opt{t_fg3}"
set-face global ts_punctuation_special          "%opt{t_fg2}"
