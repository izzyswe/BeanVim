-- local filetype = require "mason-lspconfig.mappings.filetype"
return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "buffers",
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          seperator = true
        }
      }
    },
  },
}
