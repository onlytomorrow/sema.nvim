return {
    bg = "#0F0F0F",
    fg = "#D6D6D6",
    bg_highlight = "#222222",
    selection = "#424242",
    cursor = "#FFFFFF",
    inactive = "#585858",
    line_number = "#585858",
    active_line_number = "#FFFFFF",

    -- syntax
    keyword = "#CCE1F1",
    control_flow = "#75CAF2",
    type = "#E1E0C8",
    interface = "#75CAF2",
    constant = "#F1D6DD",
    number = "#E3A6DC",
    string = "#CFE8B7",
    character = "#CFE8B7",
    property = "#DBDCF3",
    enum_member = "#DBDCF3",
    boolean = "#DBDCF3",
    macro = "#D7E3CD",
    format_specifier = "#DBDCF3",
    escape_sequence = "#DBDCF3",
    lifetime = "#75CAF2",
    comment = "#FFFFFF",
    attribute = "#949494",
    error = "#F7A597",
    warning = "#F7A597",
    punct = "#FECF5A",

    -- special modifiers
    mutable = { underline = true },
    consuming = { italic = true },
    unsafe = { fg = "#F7A597", bold = true },
    public_decl = { fg = "#E3A6DC" },

    -- lualine
    line = {
        fg = "#D9D9D9",
        bg = "#242424",

        fg_ins = "#DDDDDD",
        bg_ins = "#708090",

        fg_cmd = "#DDDDDD",
        bg_cmd = "#708090",

        fg_vis = "#000000",
        bg_vis = "#DDDDDD",

        fg_rep = "#000000",
        bg_rep = "#DDDDDD",

        fg_inactive = "#444444",
        bg_inactive = "#080808",

    },

}
