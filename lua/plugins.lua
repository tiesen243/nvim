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

	-- Highlight Syntax
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	-- Dashboard
	use("goolord/alpha-nvim")

	-- Which Key
	use("folke/which-key.nvim")

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope-media-files.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")

	-- Tmux Navigator
	use("christoomey/vim-tmux-navigator")

	-- Comment
	use("terrortylor/nvim-comment")

	-- Float Command Line
	use("VonHeikemen/fine-cmdline.nvim")
	use("MunifTanjim/nui.nvim")
	use("stevearc/dressing.nvim")

	-- Colorizer
	use("NvChad/nvim-colorizer.lua")

	-- Indent Blankline
	use("lukas-reineke/indent-blankline.nvim")

	-- Notify
	use("rcarriga/nvim-notify")

	-- Toggle term
	use("akinsho/nvim-toggleterm.lua")

	-- Git Signs --
	use("lewis6991/gitsigns.nvim")

	-- CMP
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-nvim-lsp")
	use("onsails/lspkind-nvim")

	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- Autopairs

	-- Copilot
	use("github/copilot.vim")

	-- Language Server Protocol
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})
	use({ "glepnir/lspsaga.nvim" })

	-- Formatting & Linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jay-babu/mason-null-ls.nvim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
