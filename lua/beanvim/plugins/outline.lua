return {
  "hedyhli/outline.nvim",
  event = "VeryLazy",
  config = function()
    require("outline").setup({
      outline_window = {
        width = 15,
        auto_jump = true,
      },
    })

    -- Autocmd to auto-open Outline for real files
    vim.api.nvim_create_autocmd("BufReadPost", {
      callback = function(args)
        local bufnr = args.buf
        if vim.api.nvim_buf_get_option(bufnr, "buftype") == "" then
          vim.schedule(function()
            require("outline").open()
            vim.cmd("wincmd p") -- <-- Switch back to the original window using <C-w> p
          end)
        end
      end,
    })

    -- Optional: map toggle again if needed
    vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
  end,
}

