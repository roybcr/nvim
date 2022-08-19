-- You must run this or `PackerSync` whenever you change your plugin configuration
-- :PackerCompile
--
-- Remove any disabled or unused plugins
-- :PackerClean
--
-- Clean, then install missing plugins
-- :PackerInstall
--
-- Clean, then update and install plugins
-- :PackerUpdate
--
-- Perform `PackerUpdate` and then `PackerCompile`
-- :PackerSync
--
-- Loads opt plugin immediately
-- :PackerLoad completion-nvim ale
--
-- ------------------------------------------------------------------------------------

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
    
    	-- You add plugins here
    	use 'wbthomason/packer.nvim' -- Package manager
    	use 'neovim/nvim-lspconfig'  -- Configurations for Neovim LSP
	use 'folke/tokyonight.nvim'  -- TokyoNight Theme
	use { 'haorenW1025/completion-nvim', opt = true,
    	  requires = { {'hrsh7th/vim-vsnip', opt = true}, 
	         {'hrsh7th/vim-vsnip-integ', opt = true}} 
     	}
	use { 'nvim-treesitter/nvim-treesitter', 
	run = function() require('nvim-treesitter.install').update({ with_sync = true }) end, }

	-- Last Line -----------
	if packer_bootstrap then
		require('packer').sync()
	end	
end)
