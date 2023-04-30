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

	-- Interface Configuration --
	-- Themes
	use 'dracula/vim'
	use 'tribela/vim-transparent'

	-- Dashboard
	use {
		'goolord/alpha-nvim',
		config = function()
			require 'alpha'.setup(require 'alpha.themes.startify'.config)
			require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
		end
	}
	use 'folke/which-key.nvim'

	-- GUI
	use 'nvim-tree/nvim-tree.lua'
	use 'nvim-tree/nvim-web-devicons'
	use 'nvim-lualine/lualine.nvim'
	use { 'akinsho/bufferline.nvim', tag = "*" }

																										-- Language Server Configuration --
	-- Syntax Highlighting
	use 'nvim-treesitter/nvim-treesitter'

	-- Language Server Protocol
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}

	-- Auto Complete
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/vim-vsnip'
	use 'hrsh7th/cmp-vsnip'
	use 'onsails/lspkind.nvim'

	-- Copilot
	use 'github/copilot.vim'

																										-- Utility Configuration --
	-- Comment
	use { 'terrortylor/nvim-comment',
		config = function()
			require('nvim_comment').setup({ comment_empty = false })
		end
	}


	-- Auto Pairs
	use 'windwp/nvim-autopairs'

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use 'nvim-telescope/telescope-media-files.nvim'

	if packer_bootstrap then
		require('packer').sync()
	end
end)
