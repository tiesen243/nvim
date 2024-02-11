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
	use({
		"Mofiqul/dracula.nvim",
		config = function()
			local dracula = require("dracula")
			dracula.setup({
				transparent_bg = true,
				italic_comment = true,
				show_end_of_buffer = true,
				lualine_bg_color = "nil",
			})
			vim.cmd("colorscheme dracula")
		end,
	})

	-- Dashboard
	use("goolord/alpha-nvim")

	-- GUI
	use("nvim-tree/nvim-tree.lua")
	use("nvim-tree/nvim-web-devicons")
	use("nvim-lualine/lualine.nvim")
	use("akinsho/bufferline.nvim")
	use("lukas-reineke/indent-blankline.nvim")

	-- Colorizer
	use("NvChad/nvim-colorizer.lua")

	-- Which Key
	use("folke/which-key.nvim")

	-- Telescope
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")

	-- Tmux Navigator
	use("christoomey/vim-tmux-navigator")

	-- Float Command Line
	use("VonHeikemen/fine-cmdline.nvim")
	use("MunifTanjim/nui.nvim")
	use("stevearc/dressing.nvim")

	-- Toggle term
	use("akinsho/nvim-toggleterm.lua")

	-- Lightspeed
	use("ggandor/lightspeed.nvim")

	-- Search and replace
	use("windwp/nvim-spectre")
	use("tpope/vim-surround")

	-- Git Plugins --

	use("lewis6991/gitsigns.nvim")
	use("sindrets/diffview.nvim")

	-- Treesitter Plugins --

	use("nvim-treesitter/nvim-treesitter")
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	-- Comment
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Language Server Protocol --

	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"glepnir/lspsaga.nvim",
		"ray-x/lsp_signature.nvim",
	})

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

	-- Copilot
	use("github/copilot.vim")

	-- Formatting & Linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jay-babu/mason-null-ls.nvim")

	-- Markdown Preview
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown", "mdx" }
		end,
		ft = { "markdown", "mdx" },
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
