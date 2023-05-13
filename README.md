# My Neovim Config

![1683780204630](https://github.com/Tiesen226/nvim/assets/101703006/08966af0-34f2-406f-a564-628ad47f6ecd)

**Requiment**<br/>

1. Nodejs: `npm i -g neovim`
2. Python: install package with pip: `neovim, black, flake8, cpplint, clang-format`
3. C/C++: install `gcc conpile` with mingw64, `clang` with visual studio installer
4. Nerdfont to dislay file icon
5. Set opacity of your terminal to use transparent background

**Key Mappings**<br/>
_The default `<leader>` shortcut is `<space>` (you can change it in `settings.lua`)_
| **Key** |**Command** |
| :---: | :---: |
|`<leader>;` |Dashboard |
|`<leader>e` |NvimTree |
|`<leader>/` |Comment Code |
|`<leader>r` |Run Code\* |
|`<leader>[` |Prev Buffer |
|`<leader>]` |Next Buffer |
|`<leader>q` |Quit |
|`<leader>Q` |Save & Quit |
|`<leader>f` |Fuzzy Finder |
|`<leader>ff`|Find Files |
|`<leader>fb`|Find Buffer |
|`<leader>fg`|Find Grep |
|`<leader>t`|Terminal |
|`<leader>tt`|Toggle Terminal |
|`<leader>tl`|Toggle Lazygit |
|`<leader>g` |Git |
|`<leader>gi`|Git init |
|`<leader>gb`|Git branch |
|`<leader>gC`|Git checkout |
|`<leader>gr`|Git remote |
|`<leader>ga`|Git add |
|`<leader>gc`|Git commit |
|`<leader>gs`|Git status |
|`<leader>gp`|Git push |
|`<leader>gP`|Git pull |
|`<leader>p` |Packer |
|`<leader>pc`|Packer compile |
|`<leader>pi`|Packer install |
|`<leader>ps`|Packer sync |
|`<leader>pu`|Packer update |
|`<leader>l` |LSP |
|`<C-h>` |Tmux Navigate Left |
|`<C-j>` |Tmux Navigate Down |
|`<C-k>` |Tmux Navigate Up |
|`<C-l>` |Tmux Navigate Right|
|`<C-s>` |Save file |
|`<C-z>`|Undo|

_(\*): I just config for run C++ and Python file (you can add more in `coderunner.lua`)_

**Command**<br/>

1. Language Server Protocol<br/>
   `:Mason`: open portable package manager<br/>
2. Transparent Background<br/>
   `:TransparentEnable `: enable transparent background<br/>
   `:TransparentDisable`: disable transparent background<br/>
3. Copilot<br/>
   `:Copilot setup `: setup github copilot<br/>
   `:Copilot enable`: enable github copilot<br/>

**Other Config**

1. Formater and Linter: add more in `null-ls.lua`
2. Dashboard: change your personal dashboard in `alpha.lua`
3. Theme: change theme in `plugins.lua` and `theme.lua`
