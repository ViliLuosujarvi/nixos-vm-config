# account-analogous: analogous run centred on blue. No red anywhere.
#
# Switch to it at runtime with:   :colorscheme account-analogous
#
# Option names are a_-prefixed so this file can coexist with account.kak (base00)
# and account-tetradic.kak (t_) - a second declare-option on a live name aborts
# the file, so all three schemes stay mutually switchable.
#
# check-hues: cyan=180 azure=210 blue=240 viol=270

### The scheme ###
#
# Four adjacent hues spanning 90 degrees, blue sitting inside the run:
#
#   cyan    hue 180   literals and data: strings, numbers, constants
#   azure   hue 210   structure and identity: types, modules, markup skeleton
#   blue    hue 240   control and action: keywords, functions, operators
#   viol    hue 270   diagnostics, danger, removal
#
# Blue is the base, so it takes the busiest family. Because the four hues are
# neighbours rather than opposites, tone carries more of the work here than in
# the tetradic scheme - the same three tones mean the same thing in every hue:
#
#   _v  vivid    the headline member of the group
#   _l  light    a close relative of the headline member
#   _m  muted    the supporting cast, present but quiet
#
# Errors cannot fall back on red here, so diagnostics take the far end of the
# run (violet) and add +b - weight, not hue, is what makes them shout.
#
# Identifiers, comments and punctuation deliberately claim no hue: they are the
# most common tokens on screen, and leaving them on the neutral ramp is what
# lets four neighbouring hues stay apart.
#
# Saturated blue is the darkest thing on a black background (blue contributes
# only 7% of luminance), so the blue family is built from lighter, less
# saturated steps than the others. Every accent still clears 3:1.

# neutrals (blue-tinted darks, to match the accents rather than fight them)
declare-option str a_bg0 'rgb:000000'   # background
declare-option str a_bg1 'rgb:07080f'   # darker variant: menus, info boxes
declare-option str a_bg2 'rgb:14172b'   # layers: status line, selections
declare-option str a_bg3 'rgb:2a2f4a'   # raised layer: padding, whitespace marks
declare-option str a_fg3 'rgb:6f76a0'   # muted: comments, punctuation, line numbers
declare-option str a_fg2 'rgb:b5bad1'   # secondary text
declare-option str a_fg1 'rgb:dce0ee'   # main text, identifiers
declare-option str a_fg0 'rgb:f8faff'   # highlighted text

# cyan - hue 180 - literals and data
declare-option str a_cyan_v 'rgb:4dffff'
declare-option str a_cyan_l 'rgb:b3ffff'
declare-option str a_cyan_m 'rgb:7acccc'

# azure - hue 210 - structure and identity
declare-option str a_azure_v 'rgb:4da6ff'
declare-option str a_azure_l 'rgb:b3d9ff'
declare-option str a_azure_m 'rgb:7aa3cc'

# blue - hue 240 - control and action (the base; lightened to stay readable)
declare-option str a_blue_v 'rgb:7a7aff'
declare-option str a_blue_l 'rgb:c2c2ff'
declare-option str a_blue_m 'rgb:8c8cd9'

# violet - hue 270 - diagnostics, danger, removal
declare-option str a_viol_v 'rgb:a64dff'
declare-option str a_viol_l 'rgb:d9b3ff'
declare-option str a_viol_m 'rgb:a37acc'

# code

set-face global value "%opt{a_cyan_v}"
set-face global type "%opt{a_azure_v}"
set-face global variable "%opt{a_fg1}"
set-face global module "%opt{a_azure_m}"
set-face global function "%opt{a_blue_l}"
set-face global identifier "%opt{a_fg1}"
set-face global string "%opt{a_cyan_v}"
set-face global error "%opt{a_viol_v}+b"
set-face global keyword "%opt{a_blue_v}+i"
set-face global operator "%opt{a_blue_m}"
set-face global attribute "%opt{a_azure_m}"
set-face global bracket "%opt{a_fg2}+b"
set-face global arguement "%opt{a_fg2}"
set-face global comma "%opt{a_fg3}"
set-face global constant "%opt{a_cyan_v}+b"
set-face global comment "%opt{a_fg3}+i"
set-face global documentation "%opt{a_fg3}+i"
set-face global docstring "%opt{a_cyan_m}+i"
set-face global meta "%opt{a_blue_m}"
set-face global builtin "%opt{a_blue_v}+b"

# text

set-face global title "%opt{a_azure_v}"
set-face global header "%opt{a_azure_l}"
set-face global bold "%opt{a_azure_l}+b"
set-face global italic "%opt{a_azure_l}+i"
set-face global mono "%opt{a_cyan_v}"
set-face global block "%opt{a_azure_m}"
set-face global link "%opt{a_azure_m}+u"
set-face global bullet "%opt{a_azure_m}"
set-face global list "%opt{a_fg1}"

# kakoune UI
#
# The UI stays on the neutral ramp, with violet reserved for the cursor and errors.
# Nothing here reuses cyan, azure or blue, so UI chrome can never be mistaken
# for a syntax token.

set-face global Default "%opt{a_fg1},%opt{a_bg0}"
set-face global PrimarySelection "%opt{a_fg0},%opt{a_bg2}"
set-face global SecondarySelection "%opt{a_fg2},%opt{a_bg1}"
set-face global PrimaryCursor "%opt{a_bg0},%opt{a_viol_v}"
set-face global SecondaryCursor "%opt{a_bg0},%opt{a_viol_m}"
set-face global PrimaryCursorEol "%opt{a_bg0},%opt{a_viol_l}"
set-face global SecondaryCursorEol "%opt{a_bg0},%opt{a_viol_m}"
set-face global LineNumbers "%opt{a_fg3},%opt{a_bg0}"
set-face global LineNumberCursor "%opt{a_viol_l},%opt{a_bg0}+b"
set-face global LineNumbersWrapped "%opt{a_fg3},%opt{a_bg0}+i"
set-face global MenuForeground "%opt{a_fg0},%opt{a_bg2}+b"
set-face global MenuBackground "%opt{a_fg2},%opt{a_bg1}"
set-face global MenuInfo "%opt{a_fg3},%opt{a_bg1}"
set-face global Information "%opt{a_fg1},%opt{a_bg2}"
set-face global Error "%opt{a_bg0},%opt{a_viol_v}"
set-face global DiagnosticError "%opt{a_viol_v}+b"
set-face global DiagnosticWarning "%opt{a_viol_l}"
set-face global StatusLine "%opt{a_fg2},%opt{a_bg2}"
set-face global StatusLineMode "%opt{a_blue_v}+i"
set-face global StatusLineInfo "%opt{a_fg1},%opt{a_bg2}"
set-face global StatusLineValue "%opt{a_cyan_m},%opt{a_bg2}"
set-face global StatusCursor "%opt{a_bg0},%opt{a_fg1}"
set-face global Prompt "%opt{a_fg0},%opt{a_bg2}+b"
set-face global MatchingChar "%opt{a_azure_v},%opt{a_bg0}+b"
set-face global Whitespace "%opt{a_bg3},%opt{a_bg0}+f"
set-face global WrapMarker Whitespace
set-face global BufferPadding "%opt{a_bg3},%opt{a_bg0}"
set-face global Search "%opt{a_bg0},%opt{a_cyan_l}"

# LSP / tree-sitter
#
# Same four families. Read down a group and the tones tell you the hierarchy:
# ts_keyword is vivid blue, its five conditional/directive relatives are the
# same blue one tone over, so they group on sight without blurring together.

# structure and identity - azure
set-face global ts_type                         "%opt{a_azure_v}"
set-face global ts_type_enum_variant            "%opt{a_azure_l}"
set-face global ts_constructor                  "%opt{a_azure_l}"
set-face global ts_namespace                    "%opt{a_azure_m}+i"
set-face global ts_attribute                    "%opt{a_azure_m}"
set-face global ts_property                     "%opt{a_azure_m}"
set-face global ts_tag                          "%opt{a_azure_v}"
set-face global ts_variable_other_member        "%opt{a_azure_m}"

# control and action - blue
set-face global ts_keyword                      "%opt{a_blue_v}"
set-face global ts_keyword_conditional          "%opt{a_blue_l}+i"
set-face global ts_keyword_control_conditional  "%opt{a_blue_l}+i"
set-face global ts_keyword_control_directive    "%opt{a_blue_l}+i"
set-face global ts_keyword_control_import       "%opt{a_blue_l}+i"
set-face global ts_keyword_directive            "%opt{a_blue_l}+i"
set-face global ts_function                     "%opt{a_blue_l}"
set-face global ts_function_builtin             "%opt{a_blue_l}+i"
set-face global ts_function_macro               "%opt{a_blue_v}+b"
set-face global ts_constant_macro               "%opt{a_blue_v}+b"
set-face global ts_operator                     "%opt{a_blue_m}"
set-face global ts_label                        "%opt{a_blue_m}+i"
set-face global ts_special                      "%opt{a_blue_l}"
set-face global ts_hint                         "%opt{a_blue_v}+b"
set-face global ts_conceal                      "%opt{a_blue_m}+i"

# literals and data - cyan
set-face global ts_string                       "%opt{a_cyan_v}"
set-face global ts_string_regex                 "%opt{a_cyan_m}"
set-face global ts_string_regexp                "%opt{a_cyan_m}"
set-face global ts_string_escape                "%opt{a_cyan_l}+b"
set-face global ts_string_special               "%opt{a_cyan_l}"
set-face global ts_string_special_path          "%opt{a_cyan_l}+u"
set-face global ts_string_special_symbol        "%opt{a_cyan_l}"
set-face global ts_string_symbol                "%opt{a_cyan_l}"
set-face global ts_constant                     "%opt{a_cyan_v}+b"
set-face global ts_constant_builtin_boolean     "%opt{a_cyan_v}+b"
set-face global ts_constant_character           "%opt{a_cyan_l}"
set-face global ts_info                         "%opt{a_cyan_v}+b"

# diagnostics, danger, removal - violet (no red in this scheme; +b does the shouting)
set-face global ts_error                        "%opt{a_viol_v}+b"
set-face global ts_tag_error                    "%opt{a_viol_v}+b"
set-face global ts_warning                      "%opt{a_viol_l}+b"
set-face global ts_spell                        "%opt{a_viol_m}+u"

# diff: added is data (cyan), removed is danger (violet), changed is structure (azure)
set-face global ts_diff_plus                    "%opt{a_cyan_v}"
set-face global ts_diff_minus                   "%opt{a_viol_v}"
set-face global ts_diff_delta                   "%opt{a_azure_v}"
set-face global ts_diff_delta_moved             "%opt{a_azure_m}"

# markup: the heading levels are one tone ramp, azure fading into the neutrals
set-face global ts_markup_heading               "%opt{a_azure_v}+b"
set-face global ts_markup_heading_1             "%opt{a_azure_v}+b"
set-face global ts_markup_heading_2             "%opt{a_azure_l}+b"
set-face global ts_markup_heading_3             "%opt{a_azure_m}+b"
set-face global ts_markup_heading_4             "%opt{a_fg0}"
set-face global ts_markup_heading_5             "%opt{a_fg1}"
set-face global ts_markup_heading_6             "%opt{a_fg2}"
set-face global ts_markup_heading_marker        "%opt{a_azure_m}+b"
set-face global ts_markup_bold                  "%opt{a_azure_l}+b"
set-face global ts_markup_italic                "%opt{a_azure_l}+i"
set-face global ts_markup_link_label            "%opt{a_azure_v}"
set-face global ts_markup_link_text             "%opt{a_azure_l}"
set-face global ts_markup_link_url              "%opt{a_azure_m}+u"
set-face global ts_markup_link_uri              "%opt{a_azure_m}+u"
set-face global ts_markup_list_numbered         "%opt{a_azure_m}+i"
set-face global ts_markup_list_unnumbered       "%opt{a_azure_m}"
set-face global ts_markup_list_checked          "%opt{a_cyan_v}"
set-face global ts_markup_list_unchecked        "%opt{a_fg3}"
set-face global ts_markup_raw                   "%opt{a_cyan_m}"
set-face global ts_markup_quote                 "%opt{a_fg3}+i"
set-face global ts_markup_strikethrough         "%opt{a_viol_m}+s"

# identifiers and plain text claim no hue
set-face global ts_text                         "%opt{a_fg1}"
set-face global ts_text_title                   "%opt{a_azure_v}+b"
set-face global ts_variable                     "%opt{a_fg1}"
set-face global ts_variable_builtin             "%opt{a_fg2}+i"
set-face global ts_variable_parameter           "%opt{a_fg2}+i"
set-face global ts_comment                      "%opt{a_fg3}+i"
set-face global ts_punctuation                  "%opt{a_fg3}"
set-face global ts_punctuation_special          "%opt{a_fg2}"
