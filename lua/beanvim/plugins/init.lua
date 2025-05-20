return {
  "nvim-lua/plenary.nvim", -- lua functions that many plugins use
  "christoomey/vim-tmux-navigator", -- tmux & split window navigation
  "nvim-java/nvim-java", -- java support in Neovim
    dependencies = {
    "nvim-java/lua-async-await",
    "nvim-java/nvim-java-core",
    "nvim-java/nvim-java-test",
    "nvim-java/nvim-java-refactor",
    "nvim-java/nvim-java-dap",
    "nvim-java/spring-boot.nvim",
    "mfussenegger/nvim-dap",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim"
  },
  lazy = false,
  
  {
    "github/copilot.vim",
    lazy = false,
    event = "InsertEnter",
  }
}
