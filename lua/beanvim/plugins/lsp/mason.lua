return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- Import mason
    local mason = require("mason")
    -- Enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- Import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup({
      -- List of servers for mason to install
      ensure_installed = {
        "html",
        "cssls",
        "tailwindcss",
        "css_variables",
        "harper_ls", -- language grammar checker LSP
        "ast_grep", -- LSP for JS, python, go, c#, c, kotlin, rust, typescript
        "jdtls", -- Java LSP
        "lua_ls", -- Lua LSP
        "graphql",
        "emmet_ls", 
        "prismals",
      },
      automatic_installation = true,
    })

    local mason_tool_installer = require("mason-tool-installer")
    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
        "pylint",
        "eslint_d",
      },
    })
  end,
}
