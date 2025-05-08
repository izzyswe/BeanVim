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
            -- -- Check if the current file is in the 'test' directory
            -- if filename_with_ext == "build.gradle.kts" or filename == "build.gradle" then
            --   cmd = "gradle build && gradle run"
            -- elseif filename_with_ext == "pom.xml" then
            --   cmd = "mvn compile exec:java"
            -- end
            if vim.fn.filereadable(project_root .. "/build.gradle.kts") == 1 or vim.fn.filereadable(project_root .. "/build.gradle") == 1 then
                cmd = "cd " .. project_root .. " && gradle build && gradle run"
            elseif vim.fn.filereadable(project_root .. "/pom.xml") == 1 then
                cmd = "cd " .. project_root .. " && mvn compile exec:java"
            else
                print("No supported build file found in project root.")
                return
            end
          else
            print("Could not find build.gradle or pom.xml in the project root.")
            return
          end

        -- comment out the above code if you want to uncomment the below code
        -- aboe code is for gradle project and below code is for java project
        -- as these 2 codes will conflict with each other

        --  if project_root then
        --     -- Check if the current file is in the 'test' directory
        --     if file:find("/test/") then
        --       -- Run tests for the project
        --       cmd = "cd " .. project_root .. " && gradle test"
        --     else
        --       -- Run gradle build and run from the project root
        --       cmd = " && gradle run" .. project_root
        --     end
        --  else
        --   -- Ensure the file path is absolute
        --   local abs_file = vim.fn.fnamemodify(file, ":p")
        --   -- Find `src/` folder
        --   local src_root = abs_file:match("(.*/src)/.*%.java$")
        --   if not src_root then
        --     print("Error: Could not find `src` folder.")
        --     return
        --   end
        --   -- Extract package path (e.g., `src/com/example/Main.java` → `com/example/Main`)
        --   local relative_path = abs_file:match(src_root .. "/(.*)%.java$")
        --   if not relative_path then
        --     print("Error: Could not determine package path.")
        --     return
        --   end
        --   -- Convert folder structure to package notation (e.g., `com/example/Main` → `com.example.Main`)
        --   local package_path = relative_path:gsub("/", ".")
        --   local bin_root = src_root:gsub("/src$", "/bin")  -- Root bin directory
        --   local bin_dir = bin_root .. "/" .. relative_path:gsub("/[^/]+$", "")  -- Package-specific directory
        --   -- Compile and run
        --   cmd = "mkdir -p " .. bin_dir
        --   cmd = "javac -d " .. bin_root .. " " .. src_root .. "/**/*.java"
        --   -- cmd = cmd .. " && javac -d " .. bin_root .. " " .. abs_file
        --   cmd = cmd .. " && java -cp " .. bin_root .. " " .. package_path
        -- end
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

