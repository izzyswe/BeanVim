-- Enable termguicolors
vim.opt.termguicolors = true

-- Define colors
local colors = {
    background = "#24283b",
    foreground = "#c0caf5",
    selection_bg = "#364a82",
    selection_fg = "#c0caf5",
    cursor_color = "#c0caf5",
    cursor_text = "#1d202f",

    -- Palette colors
    black = "#1d202f",
    red = "#f7768e",
    green = "#9ece6a",
    yellow = "#e0af68",
    blue = "#7aa2f7",
    magenta = "#bb9af7",
    cyan = "#7dcfff",
    white = "#a9b1d6",
    bright_black = "#414868",
    bright_red = "#f7768e",
    bright_green = "#9ece6a",
    bright_yellow = "#e0af68",
    bright_blue = "#7aa2f7",
    bright_magenta = "#bb9af7",
    bright_cyan = "#7dcfff",
    bright_white = "#c0caf5",
}

-- Function to safely apply highlights
local function set_highlight(group, options)
    vim.api.nvim_set_hl(0, group, options)
end

-- Apply highlight groups
set_highlight("Normal", { fg = colors.foreground, bg = colors.background })
set_highlight("Cursor", { fg = colors.cursor_text, bg = colors.cursor_color })
set_highlight("Visual", { fg = colors.selection_fg, bg = colors.selection_bg })
set_highlight("Comment", { fg = "#a5a6a8", italic = true })
set_highlight("Keyword", { fg = colors.blue, bold = true })
set_highlight("String", { fg = colors.green })
set_highlight("Function", { fg = colors.magenta })
set_highlight("Variable", { fg = colors.white })
set_highlight("Type", { fg = colors.yellow, bold = true })
set_highlight("Constant", { fg = colors.cyan })
set_highlight("Error", { fg = colors.red, bg = "NONE", bold = true })
set_highlight("WarningMsg", { fg = colors.yellow, bold = true })
set_highlight("StatusLine", { fg = colors.foreground, bg = colors.black })
set_highlight("SignColumn", { bg = colors.background })
set_highlight("LineNr", { fg = colors.bright_black })
set_highlight("CursorLine", { bg = "#30384f", fg = "NONE" })
set_highlight("CursorLineNr", { fg = colors.foreground, bold = true })
set_highlight("MatchParen", { fg = colors.red, bg = colors.selection_bg })
set_highlight("Pmenu", { fg = colors.foreground, bg = colors.black })
set_highlight("PmenuSel", { fg = colors.black, bg = colors.blue })
set_highlight("PmenuThumb", { bg = colors.blue })
set_highlight("PmenuSbar", { bg = colors.black })
set_highlight("VertSplit", { fg = colors.bright_black, bg = colors.black })

