local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	-- Packer
	use 'wbthomason/packer.nvim'


	-- Interface Plugins --
	-- Themes
	use 'folke/tokyonight.nvim'
	-- GUI
	use 'nvim-tree/nvim-tree.lua'
	use 'nvim-tree/nvim-web-devicons'
	use 'nvim-lualine/lualine.nvim'
	use { 'akinsho/bufferline.nvim', tag = "*" }
	-- Dashboard
	use {
		'goolord/alpha-nvim',
		config = function()
			require 'alpha'.setup(require 'alpha.themes.startify'.config)
			require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
		end
	}
	-- Which Key
	use 'folke/which-key.nvim'
	-- Telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use 'nvim-telescope/telescope-media-files.nvim'


	-- Auto Complete
	-- CMP
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/vim-vsnip'
	use 'hrsh7th/cmp-vsnip'
	-- Copilot
	use 'github/copilot.vim'
	-- Auto Close
	use 'windwp/nvim-autopairs'
	use 'windwp/nvim-ts-autotag'
	-- Comment
	use { 'terrortylor/nvim-comment',
		config = function()
			require('nvim_comment').setup({ comment_empty = false })
		end
	}


	-- Language Server Configuration --
	-- Language Server Protocol
	use {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'neovim/nvim-lspconfig',
		run = ':MasonUpdate'
	}
	use { 'glepnir/lspsaga.nvim', branch = 'main' }
	use 'onsails/lspkind.nvim'
	use 'jose-elias-alvarez/typescript.nvim'
	-- Syntax Highlighting
	use 'nvim-treesitter/nvim-treesitter'
	-- Formatting and linting
	use 'jose-elias-alvarez/null-ls.nvim'
	use 'jayp0521/mason-null-ls.nvim'


	-- Git Plugins --
	use 'lewis6991/gitsigns.nvim'


	if packer_bootstrap then
		require('packer').sync()
	end
end)
