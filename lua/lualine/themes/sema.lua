local palette = require("sema.palette")

local theme = {
    normal = {
        a = { fg = palette.line.fg, bg = palette.line.bg, gui = 'bold' },
        b = { fg = palette.line.fg, bg = palette.line.bg },
        c = { fg = palette.line.fg, bg = palette.line.bg }
    },
    insert = {
        a = { fg = palette.line.fg_ins, bg = palette.line.bg_ins, gui = 'bold' },
        b = { fg = palette.line.fg, bg = palette.line.bg },
        c = { fg = palette.line.fg, bg = palette.line.bg }
    },
    visual = {
        a = { fg = palette.line.fg_vis, bg = palette.line.bg_vis, gui = 'bold' },
        b = { fg = palette.line.fg, bg = palette.line.bg },
        c = { fg = palette.line.fg, bg = palette.line.bg }
    },
    replace = {
        a = { fg = palette.line.fg_rep, bg = palette.line.bg_rep, gui = 'bold' },
        b = { fg = palette.line.fg, bg = palette.line.bg },
        c = { fg = palette.line.fg, bg = palette.line.bg }
    },
    command = {
        a = { fg = palette.line.fg_cmd, bg = palette.line.bg_cmd, gui = 'bold' },
        b = { fg = palette.line.fg, bg = palette.line.bg },
        c = { fg = palette.line.fg, bg = palette.line.bg }
    },
    inactive = {
        a = { fg = palette.line.fg_inactive, bg = palette.line.bg_inactive, gui = 'bold' },
        b = { fg = palette.line.fg, bg = palette.line.bg },
        c = { fg = palette.line.fg, bg = palette.line.bg }
    }
}

return theme
