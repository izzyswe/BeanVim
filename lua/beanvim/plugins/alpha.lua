return{
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set Header
    local logo = [[
                 #####                  
              ##*******##               
           ##*************##            
        ##********# #********##         
     ##*********#      #********###     
   #**********#    ##    #**********#   
  #*********#   ##**#      **********   
  #********#   #***#   *#   *********   
  #********   *****   ***#   ********   
  #*******   #****#  #****#  #*******   
  #*******   *****#  #****#   *******   
  #*******   ******   ****#   *******   
  #*******   ******  #****#  #*******   
  #*******#  #****#  *****   ********   
  #********#  #***  #***#   #********   
  #*********#   #*#****#   #*********   
   #**********    ###     **********#   
     ##*********        *********##     
        ##********#  #********##        
           ##**************##           
              ##********##              
                 ##**##                 

      ]]
    dashboard.section.header.val = vim.split(logo, '\n')
    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("SPC ff", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>cd ~/Documents/<CR>"),
      dashboard.button('N/A', "  > Quick Setting", "<cmd>lua vim.cmd('cd ~/.config/nvim-bean'); require('telescope.builtin').find_files()<CR>"),
      dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    vim.api.nvim_create_autocmd("User", {
      pattern = "AlphaReady",
      callback = function()
        vim.opt.showtabline = 0
      end,
    })

    -- Show bufferline again when leaving Alpha
    vim.api.nvim_create_autocmd("BufUnload", {
      callback = function()
        local current_ft = vim.bo.filetype
        if current_ft ~= "alpha" then
          vim.opt.showtabline = 2
        end
      end,
    })

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
