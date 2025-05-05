require("beanvim.core.options")
require("beanvim.core.keymaps")

--custom command to run and create a gradle java project
vim.api.nvim_create_user_command(
  'GradleInit',
  function()
    vim.cmd('!gradle init --type java-application')
  end,
  { nargs = 0 }
)

--require("beanvim.core.color") -- Load color scheme

