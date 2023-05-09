local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	-- Packer
	use("wbthomason/packer.nvim")

	-- Interface Plugins --

	-- Themes
	use("Mofiqul/dracula.nvim")
	use("xiyaowong/transparent.nvim")

	-- GUI
	use("nvim-tree/nvim-tree.lua")
	use("nvim-tree/nvim-web-devicons")
	use("nvim-lualine/lualine.nvim")
	use({ "akinsho/bufferline.nvim", tag = "*" })

	-- Dashboard
	use("goolord/alpha-nvim")

	-- Which Key
	use("folke/which-key.nvim")

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("nvim-telescope/telescope-media-files.nvim")

	-- Tmux Navigator
	use("christoomey/vim-tmux-navigator")

	-- Comment
	use("terrortylor/nvim-comment")

	-- Auto Complete Plugins --

	-- CMP
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- Copilot
	use("github/copilot.vim")

	-- Auto Close
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	-- Code Runner
	use("CRAG666/code_runner.nvim")

	-- Language Server Configuration --

	-- Language Server Protocol
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig")

	-- LSP Config
	use("hrsh7th/cmp-nvim-lsp")
	use("onsails/lspkind-nvim")
	use({ "glepnir/lspsaga.nvim", branch = "main" })

	-- Highlight Syntax
	use("nvim-treesitter/nvim-treesitter")

	-- Formatting & Linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jay-babu/mason-null-ls.nvim")

	-- Git Plugins --
	use("lewis6991/gitsigns.nvim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
