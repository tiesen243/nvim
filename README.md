# My Neovim Config

**Requiment**<br/>

1. Install packer at [here](https://github.com/wbthomason/packer.nvim)
2. Install nerd-font at [here](https://www.nerdfonts.com/font-downloads) and set it as your terminal font (I use FiraCode Nerd Font)
3. Install fzf, fd, ripgrep, sed, lazygit

**Try my config**<br/>

> Windows

```bash
git clone git@github.com:Tiesen226/nvim.git $env:LOCALAPPDATA\nvim
```

> Linux

```bash
git clone git@github.com:Tiesen226/nvim.git ~/.config/nvim
```

**Note**<br/>

1. The default `<leader>` shortcut is `<space>` (you can change it in `settings.lua`)
2. I just config for run C++, Python and JavaScript file with `<leader>r` (you can add more in `coderunner.lua`)

**Command**<br/>

1. Language Server Protocol: `:Mason`
2. Show keymappings: `<leader>uk`
3. Copilot<br/>
   `:Copilot setup `: setup github copilot<br/>
   `:Copilot enable`: enable github copilot<br/>

**Other Config**

1. Formater and Linter: add more in `null-ls.lua`
2. Dashboard: change your personal dashboard in `alpha.lua`
3. Theme: change theme in `plugins.lua` and `theme.lua`
