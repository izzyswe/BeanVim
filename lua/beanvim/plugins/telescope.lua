return{
  {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions  = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = { --BTW C is ctrl in this
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    -- set Keymappings
    local keymap = vim.keymap -- for consciseness

    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = " Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = " Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = " Find string in cwd " })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = " find string under cursor in cwd" })
  end,
  },
  {
    "dimaportenko/telescope-simulators.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("simulators").setup({
        android_emulator = true,
        apple_simulator = false,
      })
    end,
  },
}
