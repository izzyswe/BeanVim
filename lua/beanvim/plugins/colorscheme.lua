-- return {
--   {
--     "askfiy/visual_studio_code",
--     priority = 100,
--     config = function()
--         vim.cmd([[colorscheme visual_studio_code]])
--     end,
--   },
-- }

-- return {
--   {
--     "dgox16/oldworld.nvim",
--     lazy = false,  -- Load the theme immediately
--     priority = 1000,  -- Ensure it loads first
--     config = function()
--       -- Apply the OldWorld theme
--       vim.cmd.colorscheme("oldworld")
--     end,
--   }
-- }

-- return {
--   -- Lazy
--   {
--     "vague2k/vague.nvim",
--     config = function()
--       require("vague").setup({
--         -- optional configuration here
--         vim.cmd.colorscheme("vague")
--       })
--     end
--   },
-- }

-- return{
--   {
--     "folke/tokyonight.nvim",
--     lazy = false,
--     priority = 1000,
--     opts = {
--       style = "Night",
--     },
--     config = function()
--       vim.cmd[[colorscheme tokyonight]]
--     end,
--   },
-- }
-- return {
--   {
--     "fynnfluegge/monet.nvim",
--     name = "monet",
--     config = function()
--       require("monet").setup {
--         transparent_background = false, -- Set this to true if you want a transparent background
--       }
--       vim.cmd([[colorscheme monet]]) -- Activate the Monet colorscheme
--     end
--   }
-- }

-- return {
--   {
--     "tyrannicaltoucan/vim-deep-space",
--     lazy = false,  -- Load the theme immediately
--     priority = 1000,  -- Ensure it loads first
--     config = function()
--       -- Apply the colorscheme
--       vim.cmd([[colorscheme deep-space]])
--
--       -- Enable true colors for better appearance
--       vim.opt.termguicolors = true
--
--       -- Set transparency (optional)
--       vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
--       vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
--     end,
--   }
-- }

-- return{
--   {
--     'projekt0n/github-nvim-theme',
--     name = 'github-theme',
--     lazy = false, -- make sure we load this during startup if it is your main colorscheme
--     priority = 1000, -- make sure to load this before all the other start plugins
--     config = function()
--       require('github-theme').setup({
--         -- ...
--       })
--
--       vim.cmd('colorscheme github_dark_default')
--     end,
--   }
-- }

--Catppuccin
-- return{
--   {
--     'catppuccin/nvim',
--     name = 'catppuccin',
--     priority = 1000,
--     config = function()
--       require("catppuccin").setup({
--         background = {
--           dark = "frappe"
--         }
--       })
--       vim.cmd('colorscheme catppuccin')
--     end,
--   }
-- }

return{
  {
    "sainnhe/gruvbox-material",
    lazy = false, -- load immediately
    priority = 1000, -- make sure it loads before other plugins
    config = function()
      vim.g.gruvbox_material_background = "soft" -- options: 'soft', 'medium', 'hard'
      vim.g.gruvbox_material_palette = "material" -- options: 'material', 'mix', 'original'
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_transparent_background = 0
      vim.o.background = "dark"
      vim.cmd.colorscheme("gruvbox-material")
    end
  }
}

--for null value use "return {}"


