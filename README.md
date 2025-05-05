<div align="center">
  <img src="https://github.com/user-attachments/assets/0ed63ca5-4cd1-4d68-a160-99e08219f729" alt="BeanVim" width="140"/>
  <h1>BeanVim</h1>
  <H3>Brew a Project, Make it Possible!</H3>
</div>

---
### TABLE OF CONTENT

- [Screenshots](#screenshots)
- [How to install](#how-to-install)
- [Plugin Features](#plugin-features)
- [Why I Made This](#why-i-made-this)
- [Commands and Keybinds](#commands-and-keybinds)
- [Other Distros](#other-distros)


# Screenshots
### Dashboard
<img width="1680" alt="Screenshot 2025-05-05 at 6 28 04 AM" src="https://github.com/user-attachments/assets/2ff9bb1a-d927-4cdc-968a-bcf8ade36e59" />
### NOTE: QUICK SETTING MAY NOT WORK FOR YOUR COMPUTER, IF THATS THE CASE GO TO /lua/beanvim/plugins/alpha.lua AND PROVIDE THE PROPER DRECTORY

### Editor Layout
<img width="1679" alt="Screenshot 2025-05-05 at 6 26 12 AM" src="https://github.com/user-attachments/assets/ec09ed2a-eff8-4b82-800e-c6b6b597ec3c" />

# How To Install
### CLONE USING THE FOLLOWING
(IF YOU DONT HAVE GIT INSTALLED, CLICK HERE [https://git-scm.com/downloads](https://git-scm.com/downloads)) <br>
copy and paste -> `git clone https://github.com/izzyswe/BeanVim.git`
<br>

#### ON MACOSX/LINUX
Go to Terminal
type `cd ~/.config/` <- this is your configuration folder where Neovim lives <br>
or open `open ~/.config` <br>
then unzip and drag the cloned folder into `~/.config/` <br>

#### ON WINDOWS
Option 1: <br>
- press Win + R <br>
- Type in the field `%LOCALAPPDATA%` <br>

Option 2: <br>
- Go to Terminal <br>
- Type `cd C:\Users\<YourUsername>\AppData\Local\` <br>

# Plugin Features
- Java LSP support via `jdtls`
- Gradle and Maven integration
- Half baked Eclipse project integration
- Android Emulation (you need Android Studio installed in order to use)
- Debugging support (DAP)
- Fuzzy finder (Telescope)
- Code formatting and linting
- Code Outline
- Tree view, lualine, and more

# Why I Made This
So this preconfiguration is based on my own configurations.
The reason i decided to make a whole dedicated version of this configuration 
java specific is if you're a weirdo like me and you are chronically obsessed with using Neovim for everything.

I like using Intellij and Eclipse works, These were the 2 tools I used for awhile before I commited to Neovim full-time <br>
Intellij IdeaVim works great and the Eclipse vim extension is abit spotty but works for what you need <br>
out of the 2, intellij vim extension works better, However, I found myself trying to force Vim keybinds into Intellij <br>
and it was getting very frustrating as there was 2 conflicting keybind for everything, Could I have just overriden alot of them? Absolutely <br>
but i didn't want to do the manual keybind change, my vim configuration had most of the basic things i needed anyways, so over the months, <br>
I tried to commit full time to neovim, it was difficult, remembering the keybind, knowing how and what the modularity did and what things do <br>

setting it up for other languages were fairly simple and doesn't require much tinkering, since the cmd line and Neovim was all you needed, <br>
and by this time, i was getting very familar with the keybind, the environment and everything, so i tried to use it for java full time <br>
but setting up for java environment was frustrating, especially when i was trying to set up the project structure to work and run like Eclipse. <br>
so I thought there would be exisiting popular pre configuration for Java or distro and i didn't found many, most of them were very general for <br>
the more modern languages or ones that don't require too much setup.

Anyways, i realized my setup has more and more became much more focused on Java, and I thought incase anyone would like to use Java in their Neovim <br>
and find it not worth or frustrating to setup a Java environment, This is for you! its not great by any means <br> 
but i think you will be able to do most of the things you want straight out of the box, no crazy configuring or tweaking.

I hope you find it just as helpful as I did when developing!

# Commands and Keybinds
placeholder

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
