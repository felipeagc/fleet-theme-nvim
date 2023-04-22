-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require('lush')
local hsl = lush.hsl

local palette = {
  background = "#181818",
  darkest = "#1e1e1e",
  darker = "#292929",
  dark = "#898989",

  light = "#d6d6dd",
  lightest = "#ffffff",

  dark_gray = "#535353",
  light_gray = "#6d6d6d",
  purple = "#a390f0",
  light_blue = "#7dbeff",
  blue = "#52a7f6",
  pink = "#d898d8",
  green = "#afcb85",
  cyan = "#78d0bd",
  orange = "#efb080",
  yellow = "#e5c995",
  red = "#CC7C8A",

  blue_accent = "#2197F3",
  pink_accent = "#E44C7A",
  green_accent = "#00AF99",
  orange_accent = "#EE7F25",
  yellow_accent = "#DEA407",
  red_accent = "#F44747",

  red_error = "#EB5F6A",
  selection = "#1F3661",
  diff_plus = "#5A9F81",
  focus = "#204474",
}

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function()
  return {
    -- The following are all the Neovim default highlight groups from the docs
    -- as of 0.5.0-nightly-446, to aid your theme creation. Your themes should
    -- probably style all of these at a bare minimum.
    --
    -- Referenced/linked groups must come before being referenced/lined,
    -- so the order shown ((mostly) alphabetical) is likely
    -- not the order you will end up with.
    --
    -- You can uncomment these and leave them empty to disable any
    -- styling for that group (meaning they mostly get styled as Normal)
    -- or leave them commented to apply vims default colouring or linking.

    Normal       { bg = hsl(palette.background), fg = hsl(palette.light) }, -- normal text
    Comment      { fg = palette.light_gray }, -- any comment
    -- ColorColumn  { }, -- used for the columns set with 'colorcolumn'
    -- Conceal      { }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor       { bg = Normal.fg, fg = palette.dark_gray }, -- character under the cursor
    -- lCursor      { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM     { }, -- like Cursor, but used when in IME mode |CursorIM|
    -- CursorColumn { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine   { bg = palette.darker }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory    { fg = palette.cyan }, -- directory names (and other special names in listings)
    DiffAdd      { fg = palette.diff_plus }, -- diff mode: Added line |diff.txt|
    DiffChange   { fg = palette.blue_accent }, -- diff mode: Changed line |diff.txt|
    DiffDelete   { fg = palette.red_accent }, -- diff mode: Deleted line |diff.txt|
    -- DiffText     { }, -- diff mode: Changed text within a changed line |diff.txt|
    diffAdded    { DiffAdd },
    diffRemoved  { DiffDelete },
    diffChanged  { DiffChange },
    EndOfBuffer  { fg = Normal.bg.lighten(20), gui = "bold" }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    -- TermCursor   { }, -- cursor in a focused terminal
    -- TermCursorNC { }, -- cursor in an unfocused terminal
    ErrorMsg     { fg = palette.red_error, gui = "underline" }, -- error messages on the command line
    VertSplit    { bg = Normal.bg, fg = Normal.bg.lighten(20) }, -- the column separating vertically split windows
    Folded       { bg = palette.darker, fg = palette.light_gray }, -- line used for closed folds
    -- FoldColumn   { }, -- 'foldcolumn'
    SignColumn   { bg = Normal.bg, fg = palette.dark_gray }, -- column where |signs| are displayed
    -- IncSearch    { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    -- Substitute   { }, -- |:substitute| replacement text highlighting
    LineNr       { fg = palette.dark_gray }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { bg = palette.darker, fg = palette.light, gui = "bold" }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen   { bg = Normal.bg.lighten(15) }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea      { }, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    -- MoreMsg      { }, -- |more-prompt|
    NonText      { fg = Comment.fg }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    -- NormalFloat  { }, -- Normal text in floating windows.
    -- NormalNC     { }, -- normal text in non-current windows
    Pmenu        { bg = palette.darkest, fg = Normal.fg }, -- Popup menu: normal item.
    PmenuSel     { bg = palette.selection, fg = Normal.fg, gui = "bold" }, -- Popup menu: selected item.
    PmenuSbar    { bg = palette.darkest, fg = Normal.fg, gui = "bold" }, -- Popup menu: scrollbar.
    PmenuThumb   { bg = palette.light_gray, fg = Normal.fg, gui = "bold" }, -- Popup menu: Thumb of the scrollbar.
    -- Question     { }, -- |hit-enter| prompt and yes/no questions
    Search       { fg = Normal.fg, bg = palette.selection, gui = "bold" }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    QuickFixLine { fg = palette.yellow }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    -- QuickFixLine { bg = Normal.bg.mix(Search.bg, 40)  }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    SpecialKey   { fg = Directory.fg }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise. 
    -- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine   { bg = palette.darker, fg = palette.light }, -- status line of current window
    StatusLineNC { bg = palette.darker, fg = palette.dark }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- TabLine      { bg = Normal.bg.lighten(10) }, -- tab pages line, not active tab page label
    -- TabLineFill  { TabLine }, -- tab pages line, where there are no labels
    -- TabLineSel   { bg = Normal.bg }, -- tab pages line, active tab page label
    Title        { fg = palette.green, gui = "bold" }, -- titles for output from ":set all", ":autocmd" etc.
    Visual       { bg = palette.selection }, -- Visual mode selection
    -- VisualNOS    { }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg   { fg = palette.yellow_accent }, -- warning messages
    Whitespace   { fg = Comment.fg }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu     { bg = palette.darker }, -- current match in 'wildmenu' completion

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Constant       { fg = palette.cyan }, -- (preferred) any constant
    String         { fg = palette.pink }, --   a string constant: "this is a string"
    Character      { fg = palette.yellow }, --  a character constant: 'c', '\n'
    Number         { fg = palette.yellow }, --   a number constant: 234, 0xff
    Boolean        { fg = palette.yellow }, --  a boolean constant: TRUE, false
    Float          { fg = palette.yellow }, --    a floating point constant: 2.3e10

    Identifier     { fg = Normal.fg }, -- (preferred) any variable name
    Function       { fg = palette.yellow }, -- function name (also: methods for classes)

    Keyword        { fg = palette.cyan }, --  any other keyword
    Statement      { Keyword }, -- (preferred) any statement
    Conditional    { Keyword }, --  if, then, else, endif, switch, etc.
    Repeat         { Keyword }, --   for, do, while, etc.
    Label          { Keyword }, --    case, default, etc.
    Operator       { fg = palette.light }, -- "sizeof", "+", "*", etc.
    Exception      { Keyword }, --  try, catch, throw

    PreProc        { Keyword }, -- (preferred) generic Preprocessor
    Include        { Keyword }, --  preprocessor #include
    Define         { Keyword }, --   preprocessor #define
    Macro          { fg = palette.green, gui = "bold" }, --    same as Define
    PreCondit      { Keyword }, --  preprocessor #if, #else, #endif, etc.

    Type           { fg = palette.light_blue }, -- (preferred) int, long, char, etc.
    -- StorageClass   { fg = "#A1B56C" }, -- static, register, volatile, etc.
    Structure      { Type }, --  struct, union, enum, etc.
    Typedef        { Type }, --  A typedef

    Special        { fg = Normal.fg }, -- (preferred) any special symbol
    SpecialChar    { fg = palette.yellow }, --  special character in a constant
    -- Tag            { }, --    you can use CTRL-] on this
    Delimiter      { fg = Normal.fg }, --  character that needs attention
    -- SpecialComment { }, -- special things inside a comment
    -- Debug          { }, --    debugging statements

    Underlined { fg = Function.fg, gui = "underline" }, -- (preferred) text that stands out, HTML links
    -- Bold       { gui = "bold" },
    -- Italic     { gui = "italic" },

    -- ("Ignore", below, may be invisible...)
    -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error          { bg = palette.red_error, fg = palette.darker }, -- (preferred) any erroneous construct

    Todo           { bg = palette.focus, fg = Operator.fg, gui = "bold" }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- used for highlighting "text" references
    -- LspReferenceRead            { } , -- used for highlighting "read" references
    -- LspReferenceWrite           { } , -- used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    DiagnosticError            { bg = Normal.bg.mix(hsl(palette.red_error), 10), fg = palette.red_error } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn             { bg = Normal.bg.mix(hsl(palette.orange_accent), 10), fg = palette.orange_accent } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo             { bg = Normal.bg.mix(Normal.fg, 10), fg = Normal.fg } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint             { bg = Normal.bg.mix(hsl(palette.blue), 10), fg = palette.blue } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    DiagnosticUnderlineError   { sp = DiagnosticError.fg, gui = "undercurl" } , -- Used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn    { sp = DiagnosticWarn.fg, gui = "undercurl" } , -- Used to underline "Warn" diagnostics.
    DiagnosticUnderlineInfo    { sp = DiagnosticInfo.fg, gui = "undercurl" } , -- Used to underline "Info" diagnostics.
    DiagnosticUnderlineHint    { sp = DiagnosticHint.fg, gui = "undercurl" } , -- Used to underline "Hint" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.

    -- See :h nvim-treesitter-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    TSAttribute          { fg = palette.green } , -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
    -- TSBoolean            { } , -- Boolean literals: `True` and `False` in Python.
    -- TSCharacter          { } , -- Character literals: `'a'` in C.
    -- TSComment            { } , -- Line comments and block comments.
    -- TSConditional        { } , -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
    -- TSConstant           { } , -- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
    TSConstBuiltin       { Type } , -- Built-in constant values: `nil` in Lua.
    -- TSConstMacro         { } , -- Constants defined by macros: `NULL` in C.
    TSConstructor        { fg = palette.yellow } , -- Constructor calls and definitions: `{}` in Lua, and Java constructors.
    -- TSError              { } , -- Syntax/parser errors. This might highlight large sections of code while the user is typing still incomplete code, use a sensible highlight.
    TSException          { fg = palette.purple } , -- Exception related keywords: `try`, `except`, `finally` in Python.
    -- TSField              { } , -- Object and struct fields.
    -- TSFloat              { } , -- Floating-point number literals.
    TSFunction           { Function } , -- Function calls and definitions.
    TSFuncBuiltin        { fg = palette.green } , -- Built-in functions: `print` in Lua.
    TSFuncMacro          { fg = palette.green } , -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
    -- TSInclude            { } , -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
    TSKeyword            { fg = palette.cyan } , -- Keywords that don't fit into other categories.
    -- TSKeywordFunction    { } , -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
    -- TSKeywordOperator    { } , -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
    -- TSKeywordReturn      { } , -- Keywords like `return` and `yield`.
    TSLabel              { fg = palette.yellow } , -- GOTO labels: `label:` in C, and `::label::` in Lua.
    -- TSMethod             { } , -- Method calls and definitions.
    TSNamespace          { fg = palette.light } , -- Identifiers referring to modules and namespaces.
    -- TSNone               { } , -- No highlighting (sets all highlight arguments to `NONE`). this group is used to clear certain ranges, for example, string interpolations. Don't change the values of this highlight group.
    -- TSNumber             { } , -- Numeric literals that don't fit into other categories.
    -- TSOperator           { } , -- Binary or unary operators: `+`, and also `->` and `*` in C.
    -- TSParameter          { } , -- Parameters of a function.
    -- TSParameterReference { } , -- References to parameters of a function.
    -- TSProperty           { } , -- Same as `TSField`.
    TSPunctDelimiter     { fg = Normal.fg } , -- Punctuation delimiters: Periods, commas, semicolons, etc.
    TSPunctBracket       { fg = Normal.fg } , -- Brackets, braces, parentheses, etc.
    TSPunctSpecial       { fg = Normal.fg } , -- Special punctuation that doesn't fit into the previous categories.
    -- TSRepeat             { } , -- Keywords related to loops: `for`, `while`, etc.
    TSString             { fg = palette.pink } , -- String literals.
    -- TSStringRegex        { } , -- Regular expression literals.
    -- TSStringEscape       { } , -- Escape characters within a string: `\n`, `\t`, etc.
    TSStringSpecial      { fg = palette.cyan } , -- Strings with special meaning that don't fit into the previous categories.
    -- TSSymbol             { } , -- Identifiers referring to symbols or atoms.
    TSTag                { fg = palette.light_blue } , -- Tags like HTML tag names.
    -- TSTagAttribute       { } , -- HTML tag attributes.
    -- TSTagDelimiter       { } , -- Tag delimiters like `<` `>` `/`.
    -- TSText               { } , -- Non-structured text. Like text in a markup language.
    -- TSStrong             { } , -- Text to be represented in bold.
    -- TSEmphasis           { } , -- Text to be represented with emphasis.
    -- TSUnderline          { } , -- Text to be represented with an underline.
    -- TSStrike             { } , -- Strikethrough text.
    -- TSTitle              { } , -- Text that is part of a title.
    -- TSLiteral            { } , -- Literal or verbatim text.
    -- TSURI                { } , -- URIs like hyperlinks or email addresses.
    -- TSMath               { } , -- Math environments like LaTeX's `$ ... $`
    -- TSTextReference      { } , -- Footnotes, text references, citations, etc.
    -- TSEnvironment        { } , -- Text environments of markup languages.
    -- TSEnvironmentName    { } , -- Text/string indicating the type of text environment. Like the name of a `\begin` block in LaTeX.
    -- TSNote               { } , -- Text representation of an informational note.
    -- TSWarning            { } , -- Text representation of a warning note.
    TSDanger             { fg = Error.bg } , -- Text representation of a danger note.
    TSType               { fg = palette.light_blue } , -- Type (and class) definitions and annotations.
    TSTypeBuiltin        { fg = palette.cyan } , -- Built-in types: `i32` in Rust.
    TSVariable           { fg = palette.light } , -- Variable names that don't fit into other categories.
    -- TSVariableBuiltin    { Identifier } , -- Variable names defined by the language: `this` or `self` in Javascript.
  }
end)

-- return our parsed theme for extension or use else where.
return theme

-- vim:set shiftwidth=2 softtabstop=2 tabstop=2 expandtab:
