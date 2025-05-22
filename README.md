<div align="center">
  <img src="https://github.com/user-attachments/assets/0ed63ca5-4cd1-4d68-a160-99e08219f729" alt="BeanVim" width="140"/>
  <h1>BeanVim</h1>
  <H3>Brew a Project, Make it Possible!</H3>
  <h5>A Java-focused, opinionated Neovim Distro</h5>
</div>

---
### TABLE OF CONTENT

- [Screenshots](#screenshots)
- [Plugin Features](#plugin-features)
- [How to install](#how-to-install)
- [Why I Made This](#why-i-made-this)
- [Commands and Keybinds](#commands-and-keybinds)
- [Other Distros](#other-distros)


# Screenshots
### Dashboard
<img width="1680" alt="Screenshot 2025-05-05 at 6 28 04 AM" src="https://github.com/user-attachments/assets/2ff9bb1a-d927-4cdc-968a-bcf8ade36e59" />

#### NOTE: QUICK SETTING MAY NOT WORK FOR YOUR COMPUTER, IF THATS THE CASE GO TO /lua/beanvim/plugins/alpha.lua AND PROVIDE THE PROPER DIRECTORY

### Editor Layout
<img width="1679" alt="Screenshot 2025-05-05 at 6 26 12 AM" src="https://github.com/user-attachments/assets/ec09ed2a-eff8-4b82-800e-c6b6b597ec3c" />

# Plugin Features
- Java LSP support via `jdtls`
- Gradle and Maven integration
- SceneBuilder Command (may need to manually switch filepath)
- (NEW) full Eclipse project integration
- Android Emulation (you need Android Studio installed in order to use)
- Debugging support (DAP)
- Fuzzy finder (Telescope)
- Code formatting and linting
- Code Outline
- Tree view, lualine, and more

# How To Install
### CLONE USING THE FOLLOWING
(IF YOU DONT HAVE GIT INSTALLED, CLICK HERE [https://git-scm.com/downloads](https://git-scm.com/downloads)) <br>
copy and paste -> `git clone https://github.com/izzyswe/BeanVim.git`
<br>

#### ENSURE GRADLE AND MAVEN IS INSTALLED OR ELSE SOME FUNCTIONALITES WILL BE VERY LIMITED

#### ON MACOSX/LINUX
Go to Terminal
type `cd ~/.config/` <- this is your configuration folder where Neovim lives <br>
or open `open ~/.config` <br>
then unzip and drag the cloned folder into `~/.config/` <br>
rename the folder to "nvim" <br>
launch Neovim by typing `nvim`

#### ON WINDOWS
Option 1: <br>
- press Win + R <br>
- Type in the field `%LOCALAPPDATA%` <br>
- rename the folder to "nvim" <br>
- launch Neovim by typing `nvim`

Option 2: <br>
- Go to Terminal <br>
- Type `cd C:\Users\<YourUsername>\AppData\Local\` <br>
- rename the folder to "nvim" <br>
- launch Neovim by typing `nvim`

# Why I Made This
So this preconfiguration is based on my own configurations.
The reason I decided to make a whole dedicated version of this configuration 
java specific is if you're a weirdo like me and you are chronically obsessed with using Neovim for everything. <br>

I like using IntelliJ and Eclipse works, These were the 2 tools I used for awhile before I committed to Neovim full-time. 
IntelliJ IdeaVim works great and the Eclipse vim extension is a bit spotty but works for what you need. 
Out of the 2 IDEs, IntelliJ vim extension works better, However, I found myself trying to force Vim keybinds into IntelliJ
and it was getting very frustrating as there was 2 conflicting keybind for everything, Could I have just overridden alot of them? Absolutely
but i didn't want to do the manual keybind change, my Neovim configuration had most of the basic things I needed anyways, so over the months, 
I tried to commit full time to Neovim, it was difficult, remembering the keybind, knowing how and what the modularity did and what things do...etc... <br>

Setting it up for other languages were fairly simple and didn't require much tinkering, since the cmd line and Neovim was all you needed. 
By this time, I was getting very familar with the keybind, the environment and everything, so I tried to use it for java full time 
but setting up for java environment was frustrating, especially when i was trying to set up the project structure to work and run like Eclipse.
so I thought there would be exisiting popular pre configuration for Java or distro and I didn't find many, most of them were very general for <br>
the more modern languages or ones that don't require too much setup, doing the bare minimum. Basically not meeting my use case.

Anyways, i realized my setup has more and more became much more focused on Java and integrated many things as a result.
I thought in case anyone would like to use Java in their Neovim and find it not worth, frustrating or time-consuming to setup a Java environment, 
This is for you! its not the great by any means but I think you will be able to do most of the things you want straight out of the box, 
no crazy configuring or tweaking. <br>

I hope you find it just as helpful as I did when developing!
<br>
# Commands and Keybinds
ALL KEYBINDS ARE CASE SENSITIVE, ALSO MY LEADER KEY IS SPACE BAR, YOURS COULD BE DIFFERENT JUST AN FYI

### Basic command to build habit

| Action  | Commands/mapping |
| --------------- | ---------- |
| Insert Mode     | `i`        |
| visual Mode     | `v`        |
| Scroll up       | `ctrl + u` |
| Scroll down     | `ctrl + d` |
| yank (copy)     | `y`        |
| paste           | `ctrl + v` |
| undo            | `u`        |
| redo            | `ctrl + r` |
| quit all        | `:qa`      |
| save            | `:w`       |
| force quit      | `:q!`      |


### Creating Projects

| Action  | Commands |
| ----------------- | ---------------------------- |
| Maven Project     | `:MavenInit <project name>`  |
| Gradle Project    | `:GradleInit`                |
| Eclipse Project   | `:EclipseInit`               |
| Web App Project   | ':WebAppInit'
| Open Scenebuilder | `:SceneBuilder <fxml name>`  | 

<br> (NOTE: you can add .fxml "projectName.fxml" if you want to be specific <br>
but the command will already know if you just type the name "projectName", Just make sure it's within the resources folder)

### Gradle/Maven Commands

| Action  | Commands |
| --------------- | ------------------ |
| Test Run        | `:Test`            |
| Run Spring Boot | `:SpringBootRun`   |

### Package Manager (Lazy.nvim & Mason)

| Action  | Commands |
| --------------- | ------------------ |
| Open Lazy       | `:Lazy`            |
| sync Lazy       | `:Lazy sync`       |
| Open Mason      | `:Mason`           |

### LSP Mapping

| Action  | Mapping |
| ------------------------- | ------------------ |
| Go to Declaration         | `g + D`            |
| Show LSP references       | `g + R`            |
| Available Code Actions    | `c + a`            |
| Smart Rename              | `<leader> + r + n` |
| Show buffer diagnostics   | `<leader> + D`     |
| Show line diagnostics     | `<leader> + d`     |
| Go to previous diagnostic | `[ + d`            |
| Go to next diagnostic     | `] + d`            |
| Show Documentation        | `K`                |
| Restart LSP               | `<leader> + r + s` |

### Code Editor & File Explorer Mapping

| Action  | Mapping |
| ------------------------------- | -------------------- |
| Run Program                     |  `<leader> + r`      |
| Toggle Terminal                 |  `ctrl + t`          |
| Toggle Outline                  |  `<leader> + O`      |
| Toggle File Explorer            |  `<leader> + e + e`  |
| Toggle Explorer on current file | `<leader> + e + f`   |
| Collapse File Explorer          | `<leader> + e + c`   |
| Refresh File Explorer           | `<leader> + e + r`   |
| stop running program (in term)  | `ctrl + c`           |

### T-MUX / Window Manipulation

| Action  | Mapping |
| -------------------------------- | ------------------ |
| Maximize/minimize split windows  | `<leader> + s + m` |
| Split window vertically          | `<leader> + s + v` |
| Split window horizontally        | `<leader> + s + h` |
| Create equal size splits         | `<leader> + s + e` |
| Close current split              | `<leader> + s + x` |

### Fuzzy Finder & Android/IOS Emulator

| Action  | Commands/Mapping |
| -------------------------------- | --------------------------- |
| Fuzzy Find in CWD                | `<leader> + f + f`          |
| Fuzzy find recent files          | `<leader> + f + r`          |
| Find string in cwd               | `<leader>fs`                |
| find string under cursor in cwd  | `<leader>fc`                |
| Open Simulators                  | `:Telescope simulators run` |


# Other Distros
Perhaps you don't find BeanVim to be helpful or what you exactly need <br>
Here are other alternatives to consider: <br>

### IzzySWE Original Configuration
[Neovim Configuration Link](https://github.com/izzyswe/Neovim) or `https://github.com/izzyswe/Neovim` <br>
### AstroVim Distro 
[Astrovim Link](https://github.com/AstroNvim/AstroNvim) or `https://github.com/AstroNvim/AstroNvim` <br>
### LunarVim 
[Lunarvim Link](https://github.com/LunarVim/LunarVim) or `https://github.com/LunarVim/LunarVim` <br>
### CosmicVim 
[CosmicVim Link](https://github.com/CosmicNvim/CosmicNvim) or `https://github.com/CosmicNvim/CosmicNvim` <br>
### NvChad 
[NvChad Link](https://github.com/NvChad/NvChad) or `https://github.com/NvChad/NvChad` <br>
### Make your own! 
[KickStart Link](https://github.com/nvim-lua/kickstart.nvim) or `https://github.com/nvim-lua/kickstart.nvim` <br>
