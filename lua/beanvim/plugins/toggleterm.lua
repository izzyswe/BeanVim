-- Function to find build.gradle or build.gradle.kts by traversing up the directory tree
local function find_project_root()
  local current_dir = vim.fn.expand("%:p:h")
  --print("Starting search for build.gradle in: " .. current_dir)  -- Debug statement
  while current_dir ~= "/" do
    --print("Checking directory: " .. current_dir)  -- Debug statement
    if vim.fn.filereadable(current_dir .. "/build.gradle") == 1 or vim.fn.filereadable(current_dir .. "/build.gradle.kts") == 1 then
      --print("Found build.gradle or build.gradle.kts in: " .. current_dir)  -- Debug statement
      return current_dir  -- Return the project root
    elseif vim.fn.filereadable(current_dir .. "/pom.xml") == 1 then
      return current_dir
    elseif vim.fn.filereadable(current_dir .. "/.project") == 1 or vim.fn.filereadable(current_dir .. "/.classpath") == 1 then
      return current_dir
    end
    current_dir = vim.fn.fnamemodify(current_dir, ":h")  -- Go up one directory
    -- print("Checking directory: " .. current_dir)  -- Debug statement
  end
  return nil
end

return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = false,
    config = function()
      require("toggleterm").setup({
        size = 15,
        open_mapping = [[<C-t>]],
        direction = "horizontal",
        close_on_exit = true,
        shell = vim.o.shell,
      })
      -- Function to run the current file
      function _G.run_current_file()
        local file = vim.fn.expand("%")  -- Full path to current file
        local dir = vim.fn.expand("%:p:h")  -- Directory of the file
        local extension = vim.fn.expand("%:e")  -- File extension
        local filename = vim.fn.expand("%:t:r")  -- Filename without extension

        local cmd = ""
        if extension == "java" then
          -- For Java files, find the project root
          local project_root = find_project_root()
          if project_root then
            if vim.fn.filereadable(project_root .. "/build.gradle.kts") == 1 or vim.fn.filereadable(project_root .. "/build.gradle") == 1 then
                cmd = "cd " .. project_root .. " && gradle build && gradle run"
            elseif vim.fn.filereadable(project_root .. "/pom.xml") == 1 then
                cmd = "cd " .. project_root .. " && mvn compile exec:java"
            elseif vim.fn.filereadable(project_root .. "/.project") == 1 or vim.fn.filereadable(project_root .. "/.classpath") == 1 then
                local java_src = project_root .. "/src"
                local bin_dir = project_root .. "/bin"
                os.execute("mkdir -p " .. bin_dir)

                -- Get relative path to current file (e.g., com/example/Main.java)
                local rel_path = vim.fn.expand("%:p"):gsub("^" .. java_src .. "/", "")
                local class_name = rel_path:gsub(".java", ""):gsub("/", ".")

                -- Build command: compile + run
                cmd = "cd " .. project_root ..
                      " && javac -d bin $(find src -name '*.java')" ..
                      " && java -cp bin " .. class_name
            else
                print("No supported build file found in project root.")
                return
            end
          else
            print("Could not find build.gradle or pom.xml in the project root.")
            return
          end
        elseif extension == "js" then
          cmd = "node " .. file
        elseif extension == "jsx" then
          cmd = "npm run dev"
        elseif extension == "html" then
          cmd = "live-server --port=8080"
        else
          print("Unsupported file type: " .. extension)
          return
        end

        local Terminal = require('toggleterm.terminal').Terminal
        local run_term = Terminal:new({
          cmd = cmd,
          hidden = true,
          direction = "horizontal",
          close_on_exit = false,
        })
        run_term:toggle()
      end

      -- Keybinding to run the current file
      vim.api.nvim_set_keymap("n", "<leader>r", "<cmd>lua run_current_file()<CR>", { noremap = true, silent = true })
      -- vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>ToggleTerm<CR>",  {noremap = true, silent = true, desc = "Toggle Term"})
    end,
  }
}

