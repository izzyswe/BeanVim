return {
  "nvim-lua/plenary.nvim", -- lua functions that many plugins use
  "christoomey/vim-tmux-navigator", -- tmux & split window navigation
  "nvim-java/nvim-java", -- java support in Neovim

  {
    "github/copilot.vim",
    lazy = false,
    event = "InsertEnter",
  }
}
