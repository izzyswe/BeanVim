require("beanvim.core.options")
require("beanvim.core.keymaps")

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

--custom command to run and create a gradle java project
vim.api.nvim_create_user_command(
  'GradleInit',
  function()
    vim.cmd('!gradle init --type java-application')
  end,
  { nargs = 0 }
)

vim.api.nvim_create_user_command(
  'MavenInit',
  function(opts)
    local project_name = opts.args
    vim.cmd('!mvn archetype:generate -DgroupId=com.'.. project_name.. ' -DartifactId=' .. project_name ..' -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.5 -DinteractiveMode=false')
  end,
  { nargs = 1 }
)

vim.api.nvim_create_user_command(
  'Test', 
  function ()
    local project_root = find_project_root()
    -- check if we are in the project root folder first
    if project_root then
         if vim.fn.filereadable(project_root .. "/build.gradle.kts") == 1 or vim.fn.filereadable(project_root .. "/build.gradle") == 1 then
              vim.cmd("!gradle test")
         elseif vim.fn.filereadable(project_root .. "/pom.xml") == 1 then
                vim.cmd("!mvn test")
         else
            print("No supported build file found in project root.")
            return
         end
    else
      print("Could not find the project test folder")
    end
  end,
  { nargs =0 }
)

vim.api.nvim_create_user_command(
  'springBootRun',
  function ()
    local project_root = find_project_root()
    -- check if we are in the project root folder first
    if project_root then
         if vim.fn.filereadable(project_root .. "/build.gradle.kts") == 1 or vim.fn.filereadable(project_root .. "/build.gradle") == 1 then
              vim.cmd("!gradle bootRun")
         elseif vim.fn.filereadable(project_root .. "/pom.xml") == 1 then
                vim.cmd("!mvn spring-boot:run")
         else
            print("No supported build file found in Spring project root.")
            return
         end
    else
      print("Could not find the Spring project folder")
    end
  end,
  { nargs =0 }
)

-- this is where you can load your custom colours
--require("beanvim.core.color") -- Load color scheme

