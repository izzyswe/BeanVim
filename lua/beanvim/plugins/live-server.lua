return{
  {
    'barrett-ruth/live-server.nvim',
    config = function()
      require'live-server'.setup{
      -- Optional: Set the command to use for running the live server
      command = "live-server --https",
     --cmd = { 'LiveServerStart', 'LiveServerStop' },

      -- Optional: Define file types that trigger the live server
      filetypes = {"html", "css", "javascript"}
    }
      end
  }
}
