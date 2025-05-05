return {
  {
    "pocco81/auto-save.nvim",
    lazy = false,  -- Load the plugin immediately
    config = function()
      local autosave = require("auto-save")

      autosave.setup({
        enabled = true,  -- Enable auto-save by default
        execution_message = {
          message = function()  -- Display a custom message after saving
            return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
          end,
          dim = 0.18,
          cleaning_interval = 1250,  -- Message disappears after 1.25 seconds
        },
        events = {"InsertLeave", "TextChanged"},  -- Auto-save on InsertLeave event
        conditions = {
          exists = true,
          filename_is_not = {},
          filetype_is_not = {},
          modifiable = true,
        },
        write_all_buffers = false,  -- Only write the current buffer
        on_off_commands = true,  -- Enable the auto-save toggle commands (ASToggle)
        clean_command_line_interval = 0,  -- No delay in cleaning command-line messages
        debounce_delay = 135,  -- Delay before writing to file (in milliseconds)
      })

      -- Keybinding to manually toggle auto-save on or off
      vim.api.nvim_set_keymap("n", "<leader>s", ":ASToggle<CR>", { noremap = true, silent = true })
    end,
  }
}


