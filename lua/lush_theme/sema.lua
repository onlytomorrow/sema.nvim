-- a port of the "sema" vscode theme for neovim
---@diagnostic disable: undefined-global

--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

local lush = require('lush')
local hsl = lush.hsl

local colors = {
    bg = hsl("#0F0F0F"),
    fg = hsl("#D6D6D6"),
    bg_highlight = hsl("#222222"),
    selection = hsl("#424242"),
    cursor = hsl("#FFFFFF"),
    inactive = hsl("#585858"),
    line_number = hsl("#585858"),
    active_line_number = hsl("#FFFFFF"),

    -- syntax
    keyword = hsl("#CCE1F1"),
    control_flow = hsl("#75CAF2"),
    type = hsl("#E1E0C8"),
    interface = hsl("#75CAF2"),
    constant = hsl("#F1D6DD"),
    number = hsl("#E3A6DC"),
    string = hsl("#CFE8B7"),
    character = hsl("#CFE8B7"),
    property = hsl("#DBDCF3"),
    enum_member = hsl("#DBDCF3"),
    boolean = hsl("#DBDCF3"),
    macro = hsl("#D7E3CD"),
    format_specifier = hsl("#DBDCF3"),
    escape_sequence = hsl("#DBDCF3"),
    lifetime = hsl("#75CAF2"),
    comment = hsl("#FFFFFF"),
    attribute = hsl("#949494"),
    error = hsl("#F7A597"),
    warning = hsl("#F7A597").lighten(20),

    -- special modifiers
    mutable = { underline = true },
    consuming = { italic = true },
    unsafe = { fg = hsl("#F7A597"), bold = true },
    public_decl = { fg = hsl("#E3A6DC") },
}

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
local sym = injected_functions.sym
    return {
        -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
        -- groups, mostly used for styling UI elements.
        -- Comment them out and add your own properties to override the defaults.
        -- An empty definition `{}` will clear all styling, leaving elements looking
        -- like the 'Normal' group.
        -- To be able to link to a group, it must already be defined, so you may have
        -- to reorder items as you go.
        --
        -- See :h highlight-groups
        --
        ColorColumn    { bg = colors.bg_highlight }, -- Columns set with 'colorcolumn'
        -- Conceal        { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
        Cursor         { fg = colors.bg, bg = colors.cursor }, -- Character under the cursor
        -- CurSearch      { }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
        -- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
        -- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
        -- CursorColumn   { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
        CursorLine     { bg = colors.bg_highlight }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
        Directory      { fg = colors.control_flow }, -- Directory names (and other special names in listings)
        DiffAdd        { fg = colors.string }, -- Diff mode: Added line |diff.txt|
        DiffChange     { fg = colors.control_flow }, -- Diff mode: Changed line |diff.txt|
        DiffDelete     { fg = colors.error }, -- Diff mode: Deleted line |diff.txt|
        DiffText       { fg = colors.control_flow, underline = true }, -- Diff mode: Changed text within a changed line |diff.txt|
        -- EndOfBuffer    { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
        TermCursor     { Cursor }, -- Cursor in a focused terminal
        TermCursorNC   { Cursor, bg = colors.inactive }, -- Cursor in an unfocused terminal
        ErrorMsg       { fg = colors.error }, -- Error messages on the command line
        VertSplit      { fg = colors.inactive }, -- Column separating vertically split windows
        Folded         { fg = colors.inactive, bg = colors.bg_highlight }, -- Line used for closed folds
        FoldColumn     { fg = colors.inactive, bg = colors.bg }, -- 'foldcolumn'
        SignColumn     { bg = colors.bg }, -- Column where |signs| are displayed
        IncSearch      { bg = colors.control_flow, fg = colors.bg }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
        -- Substitute     { }, -- |:substitute| replacement text highlighting
        LineNr         { fg = colors.line_number }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
        -- LineNrAbove    { }, -- Line number for when the 'relativenumber' option is set, above the cursor line
        -- LineNrBelow    { }, -- Line number for when the 'relativenumber' option is set, below the cursor line
        CursorLineNr   { fg = colors.active_line_number }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
        -- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
        -- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
        MatchParen     { bg = colors.selection, fg = colors.cursor }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
        -- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
        -- MsgArea        { }, -- Area for messages and cmdline
        -- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
        MoreMsg        { fg = colors.string }, -- |more-prompt|
        NonText        { fg = colors.inactive }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
        Normal         { bg = colors.bg, fg = colors.fg }, -- Normal text
        NormalFloat    { bg = colors.bg_highlight, fg = colors.fg }, -- Normal text in floating windows.
        -- FloatBorder    { }, -- Border of floating windows.
        -- FloatTitle     { }, -- Title of floating windows.
        -- NormalNC       { }, -- normal text in non-current windows
        Pmenu          { bg = colors.bg_highlight, fg = colors.fg }, -- Popup menu: Normal item.
        PmenuSel       { bg = colors.selection, fg = colors.fg }, -- Popup menu: Selected item.
        -- PmenuKind      { }, -- Popup menu: Normal item "kind"
        -- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
        -- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
        -- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
        PmenuSbar      { bg = colors.bg_highlight }, -- Popup menu: Scrollbar.
        PmenuThumb     { bg = colors.inactive }, -- Popup menu: Thumb of the scrollbar.
        Question       { fg = colors.string }, -- |hit-enter| prompt and yes/no questions
        -- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
        Search         { bg = colors.selection, fg = colors.fg }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
        SpecialKey     { fg = colors.inactive }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
        SpellBad       { fg = colors.error, undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
        SpellCap       { fg = colors.warning, undercurl = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
        SpellLocal     { fg = colors.warning, undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
        SpellRare      { fg = colors.property, undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
        StatusLine     { bg = colors.bg, fg = colors.fg }, -- Status line of current window
        StatusLineNC   { bg = colors.bg, fg = colors.inactive }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
        TabLine        { bg = colors.bg, fg = colors.inactive }, -- Tab pages line, not active tab page label
        TabLineFill    { bg = colors.bg }, -- Tab pages line, where there are no labels
        TabLineSel     { bg = colors.bg_highlight, fg = colors.fg }, -- Tab pages line, active tab page label
        Title          { fg = colors.type, bold = true }, -- Titles for output from ":set all", ":autocmd" etc.
        Visual         { bg = colors.selection }, -- Visual mode selection
        VisualNOS      { bg = colors.selection }, -- Visual mode selection when vim is "Not Owning the Selection".
        WarningMsg     { fg = colors.warning }, -- Warning messages
        -- Whitespace     { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
        -- Winseparator   { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
        WildMenu       { bg = colors.selection, fg = colors.fg }, -- Current match in 'wildmenu' completion
        -- WinBar         { }, -- Window bar of current window
        -- WinBarNC       { }, -- Window bar of not-current windows

        -- Common vim syntax groups used for all kinds of code and markup.
        -- Commented-out groups should chain up to their preferred (*) group
        -- by default.
        --
        -- See :h group-name
        --
        -- Uncomment and edit if you want more specific syntax highlighting.

        Comment        { fg = colors.comment, italic = true }, -- Any comment

        Constant       { fg = colors.constant }, -- (*) Any constant
        String         { fg = colors.string }, --   A string constant: "this is a string"
        Character      { fg = colors.character }, --   A character constant: 'c', '\n'
        Number         { fg = colors.number }, --   A number constant: 234, 0xff
        Boolean        { fg = colors.boolean }, --   A boolean constant: TRUE, false
        Float          { fg = colors.number }, --   A floating point constant: 2.3e10

        Identifier     { fg = colors.fg }, -- (*) Any variable name
        Function       { fg = colors.fg }, --   Function name (also: methods for classes)

        Statement      { fg = colors.keyword }, -- (*) Any statement
        Conditional    { fg = colors.control_flow }, --   if, then, else, endif, switch, etc.
        Repeat         { fg = colors.control_flow }, --   for, do, while, etc.
        Label          { fg = colors.control_flow }, --   case, default, etc.
        Operator       { fg = colors.fg }, --   "sizeof", "+", "*", etc.
        Keyword        { fg = colors.keyword }, --   any other keyword
        Exception      { fg = colors.control_flow }, --   try, catch, throw

        PreProc        { fg = colors.macro }, -- (*) Generic Preprocessor
        Include        { fg = colors.macro }, --   Preprocessor #include
        Define         { fg = colors.macro }, --   Preprocessor #define
        Macro          { fg = colors.macro }, --   Same as Define
        PreCondit      { fg = colors.macro }, --   Preprocessor #if, #else, #endif, etc.

        Type           { fg = colors.type }, -- (*) int, long, char, etc.
        StorageClass   { fg = colors.keyword }, --   static, register, volatile, etc.
        Structure      { fg = colors.type }, --   struct, union, enum, etc.
        Typedef        { fg = colors.type }, --   A typedef

        Special        { fg = colors.property }, -- (*) Any special symbol
        SpecialChar    { fg = colors.escape_sequence }, --   Special character in a constant
        Tag            { fg = colors.type }, --   You can use CTRL-] on this
        Delimiter      { fg = colors.fg }, --   Character that needs attention
        SpecialComment { fg = colors.comment, bold = true }, --   Special things inside a comment (e.g. '\n')
        Debug          { fg = colors.error }, --   Debugging statements

        Underlined     { underline = true }, -- Text that stands out, HTML links
        Ignore         { fg = colors.inactive }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
        Error          { fg = colors.error }, -- Any erroneous construct
        Todo           { fg = colors.bg, bg = colors.string, bold = true }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

        -- These groups are for the native LSP client and diagnostic system. Some
        -- other LSP clients may use these groups, or use their own. Consult your
        -- LSP client's documentation.

        -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
        --
        -- LspReferenceText            { } , -- Used for highlighting "text" references
        -- LspReferenceRead            { } , -- Used for highlighting "read" references
        -- LspReferenceWrite           { } , -- Used for highlighting "write" references
        -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
        -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
        -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

        -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
        --
        DiagnosticError            { fg = colors.error }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        DiagnosticWarn             { fg = colors.warning }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        DiagnosticInfo             { fg = colors.control_flow }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        DiagnosticHint             { fg = colors.string }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        -- DiagnosticOk               { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        DiagnosticVirtualTextError { fg = colors.error, bg = colors.error.darken(50).saturation(10) }, -- Used for "Error" diagnostic virtual text.
        DiagnosticVirtualTextWarn  { fg = colors.warning, bg = colors.warning.darken(50).saturation(10) }, -- Used for "Warn" diagnostic virtual text.
        DiagnosticVirtualTextInfo  { fg = colors.control_flow, bg = colors.control_flow.darken(50).saturation(10) }, -- Used for "Info" diagnostic virtual text.
        DiagnosticVirtualTextHint  { fg = colors.string, bg = colors.string.darken(50).saturation(10) }, -- Used for "Hint" diagnostic virtual text.
        -- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
        DiagnosticUnderlineError   { undercurl = true, sp = colors.error }, -- Used to underline "Error" diagnostics.
        DiagnosticUnderlineWarn    { undercurl = true, sp = colors.warning }, -- Used to underline "Warn" diagnostics.
        DiagnosticUnderlineInfo    { undercurl = true, sp = colors.control_flow }, -- Used to underline "Info" diagnostics.
        DiagnosticUnderlineHint    { undercurl = true, sp = colors.string }, -- Used to underline "Hint" diagnostics.
        -- DiagnosticUnderlineOk      { } , -- Used to underline "Ok" diagnostics.
        -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
        -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
        -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
        -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
        -- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
        -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
        -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
        -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
        -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
        -- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

        -- Tree-Sitter syntax groups.
        --
        -- See :h treesitter-highlight-groups, some groups may not be listed,
        -- submit a PR fix to lush-template!
        --
        -- Tree-Sitter groups are defined with an "@" symbol, which must be
        -- specially handled to be valid lua code, we do this via the special
        -- sym function. The following are all valid ways to call the sym function,
        -- for more details see https://www.lua.org/pil/5.html
        --
        -- sym("@text.literal")
        -- sym('@text.literal')
        -- sym"@text.literal"
        -- sym'@text.literal'
        --
        -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

        sym"@text.literal"        { Comment }, -- Comment
        sym"@text.reference"      { Identifier }, -- Identifier
        sym"@text.title"          { Title }, -- Title
        sym"@text.uri"            { fg = colors.string, underline = true }, -- Underlined
        sym"@text.underline"      { underline = true }, -- Underlined
        sym"@text.todo"           { Todo }, -- Todo
        sym"@comment"             { Comment }, -- Comment
        sym"@punctuation"         { Delimiter }, -- Delimiter
        sym"@constant"            { Constant }, -- Constant
        sym"@constant.builtin"    { Constant }, -- Special
        sym"@constant.macro"      { Macro }, -- Define
        sym"@define"              { Define }, -- Define
        sym"@macro"               { Macro }, -- Macro
        sym"@string"              { String }, -- String
        sym"@string.escape"       { SpecialChar }, -- SpecialChar
        sym"@string.special"      { SpecialChar }, -- SpecialChar
        sym"@character"           { Character }, -- Character
        sym"@character.special"   { SpecialChar }, -- SpecialChar
        sym"@number"              { Number }, -- Number
        sym"@boolean"             { Boolean }, -- Boolean
        sym"@float"               { Float }, -- Float
        sym"@function"            { Function }, -- Function
        sym"@function.builtin"    { Function }, -- Special
        sym"@function.macro"      { Macro }, -- Macro
        sym"@parameter"           { fg = colors.fg }, -- Identifier
        sym"@method"              { Function }, -- Function
        sym"@field"               { fg = colors.property }, -- Identifier
        sym"@property"            { fg = colors.property }, -- Identifier
        sym"@constructor"         { fg = colors.fg }, -- Special
        sym"@conditional"         { Conditional }, -- Conditional
        sym"@repeat"              { Repeat }, -- Repeat
        sym"@label"               { Label }, -- Label
        sym"@operator"            { Operator }, -- Operator
        sym"@keyword"             { Keyword }, -- Keyword
        sym"@exception"           { Exception }, -- Exception
        sym"@variable"            { fg = colors.fg }, -- Identifier
        sym"@type"                { Type }, -- Type
        sym"@type.definition"     { Typedef }, -- Typedef
        sym"@storageclass"        { StorageClass }, -- StorageClass
        sym"@structure"           { Structure }, -- Structure
        sym"@namespace"           { fg = colors.type }, -- Identifier
        sym"@include"             { Include }, -- Include
        sym"@preproc"             { PreProc }, -- PreProc
        sym"@debug"               { Debug }, -- Debug
        sym"@tag"                 { Tag }, -- Tag

        -- LSP Semantic Tokens
        sym"@lsp.type.class"         { Type },
        sym"@lsp.type.comment"       { Comment },
        sym"@lsp.type.decorator"     { fg = colors.attribute },
        sym"@lsp.type.enum"          { Type },
        sym"@lsp.type.enumMember"    { fg = colors.enum_member },
        sym"@lsp.type.function"      { Function },
        sym"@lsp.type.interface"     { fg = colors.interface },
        sym"@lsp.type.keyword"       { Keyword },
        sym"@lsp.type.macro"         { Macro },
        sym"@lsp.type.method"        { Function },
        sym"@lsp.type.namespace"     { fg = colors.type },
        sym"@lsp.type.number"        { Number },
        sym"@lsp.type.operator"      { Operator },
        sym"@lsp.type.parameter"     { fg = colors.fg },
        sym"@lsp.type.property"      { fg = colors.property },
        sym"@lsp.type.string"        { String },
        sym"@lsp.type.struct"        { Type },
        sym"@lsp.type.type"          { Type },
        sym"@lsp.type.typeParameter" { fg = colors.interface },
        sym"@lsp.type.variable"      { fg = colors.fg },

        -- LSP Modifiers
        sym"@lsp.mod.constant"       { fg = colors.constant },
        sym"@lsp.mod.controlFlow"    { fg = colors.control_flow },
        sym"@lsp.mod.mutable"        { underline = true },
        sym"@lsp.mod.consuming"      { italic = true },
        sym"@lsp.mod.unsafe"         { fg = colors.error, bold = true },

        Terminal               { Normal },
    }
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
