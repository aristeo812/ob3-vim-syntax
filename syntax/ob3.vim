"
" Vim syntax file
" Language:   Openbox v3.2 themerc syntax	
" Author:     Dave Foster <daf at minuslab.net>
" Author:     Victor Brand (Zhuravlev) https://github.com/aristeo812
" Version:    2
"
" Syntax highlighting for Openbox theme files. Requires vim 6.3 or
" later.
"
" Based on Ciaran McCreesh's Gentoo packages.keywords syntax file
"
" V. Brand: I don't remember where I downloaded the original work of
" Mr. Dave Foster from, but after using it for several years, I heavily
" reworked this file, added new features and overall polished it out.

if &compatible || v:version < 603
    finish
endif

if exists('b:current_syntax')
  finish
endif

" matches
syn region OB3_Comment start='\v!|#' end='$'

" In Openbox theme, color can be specified by its name. Openbox utilizes the
" X11 color names. See: http://openbox.org/wiki/Help:Themes#Color_names 
" For a comprehensive list of X11 color names, please refer to:
" See: https://www.ehdp.com/methods/x11-colors/x11-colors-rgb-values-03.htm
" See: https://www.w3schools.com/colors/colors_x11.asp
" Here, I specify only several basic color names, because who ever needs them.
" These will be coloured as constants
syn match OB3_X11_Colors '\v\c<(black|blue[1-4]?|cyan[1-4]?|gr[ae]y([1-9][0-9]?)?|green[1-4]?|magenta[1-4]?|red[1-4]?|white|yellow[1-4]?)>'

" Kinda 'keywords'
syn match OB3_Words '\v\c\zs<(bevel[12]|border|center|(cross)?diagonal|gradient|flat|interlaced|left|(mirror)?horizontal|parentrelative|pyramid|raised|right|solid|splitvertical|sunken|vertical)>'

" Identifiers of the elements. I put together these lists according to the
" official documentation found here: http://openbox.org/wiki/Help:Themes
" Apart from that, I've added syntax rules for menu.bullet properties, which
" are not listed in the official documentation for some reason, but they
" proved to be working in practice.
syn match OB3_ThemeItem '\v\c\zs\s*(border|menu|osd|padding|window|\*)\.((active|bg|border|box|bullet|button|client|color|colorto|disabled|focused|grip|handle|highlight|hilight|hover|image|inactive|items|label|overlap|padding|pressed|selected|separator|text|title|toggled|unhilight|unpressed|\*)\.)*(bg|color|colorTo|font|height|highlight|justify|overlap|shadow|splitTo|width|x|y)\s*:' contains=NONE excludenl

" Hex color codes.
" According to the documentation, RGB values are encoded as following:
" #rgb, #rrggbb, rgb:rr/bb/gg (sic!)
syn match OB3_ColorCode '\v[^\_^]((#(([A-Fa-f0-9]{6})|([A-Fa-f0-9]{3})))|(<rgb:[A-Fa-f0-9]{2}/[A-Fa-f0-9]{2}/[A-Fa-f0-9]{2})|(<rgb:[A-Fa-f0-9]/[A-Fa-f0-9]/[A-Fa-f0-9]))>'

" Specifications of font shadows in '*.font:' properties.
" Actually, there are much more properties in X11 specification, and they are
" available, but who ever uses them in Openbox themes.
syn match OB3_FontProperties '\vshadow\=[yn](:|>)|shadowoffset\=\d(:|>)|shadowtint\=\-=(100|([0-9]{1,2}))(:|>)'

" Numbers. Not an ideal definition, but it works
syn match OB3_Number '\v(<|((^|\s)-))[0-9]+>'


" Let's colorize our letters
hi def link OB3_Comment        Comment
hi def link OB3_ColorCode      Special
hi def link OB3_Number         Number
hi def link OB3_Words          Keyword
hi def link OB3_ThemeItem      Identifier
hi def link OB3_FontProperties String
hi def link OB3_X11_Colors     Constant

" Customizing comments
setlocal comments=:!,:# 
setlocal commentstring=!%s

" Finally, setting syntax
let b:current_syntax = "ob3"

