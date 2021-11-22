return {
  { 'wbthomason/packer.nvim' },

  -- Change
  { 'tpope/vim-surround' },
  { 'tpope/vim-repeat' },
  {
    "haya14busa/vim-asterisk",
    config = function()
      require "young.mod.asterisk"
    end,
  },
  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  {
    "chaoren/vim-wordmotion",
    event = "CursorMoved",
    setup = function()
      vim.g.wordmotion_prefix = ";"
    end,
  },
  {
    "monaqa/dial.nvim",
    event = "BufRead",
    config = function()
      require('young.mod.dial').done()
    end,
  },
  {
    "ggandor/lightspeed.nvim",
    event = "BufRead",
    config = function()
      require "young.mod.lightspeed"
    end,
  },

  -- UI
  {
    'romgrk/barbar.nvim',
    event = 'BufWinEnter',
    config = function()
      require('young.mod.barbar').hot()
    end,
  },
  { 'nvim-lualine/lualine.nvim', config = require 'plug-config.lualine' },
  -- { 'NTBBloodbath/galaxyline.nvim', config = require('plug-config.galaxyline')}
  {
    'kyazdani42/nvim-tree.lua',
    event = 'BufWinEnter',
    config = function()
      require('young.mod.nvim-tree').done()
    end,
  },
  { 'kyazdani42/nvim-web-devicons' },
  { 
    'goolord/alpha-nvim', 
    -- config = require 'plug-config.alpha'
    config = function()
      -- require('alpha').setup(require('young.mod.alpha.screen').opts)
      require('young.mod.alpha').done()
    end
  },
  {
    'akinsho/toggleterm.nvim',
    event = 'BufWinEnter',
    config = function()
      require('young.mod.toggleterm').done()
    end,
  },
  {
    'folke/trouble.nvim',
    event = 'BufRead',
    config = function()
      require('young.mod.trouble').done()
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = function()
      require('young.mod.indent-blankline').done()
    end,
  },

  -- Colorscheme & Colors
  { 'nvim-treesitter/nvim-treesitter', config = require 'plug-config.treesitter', run = ':TSUpdate' },
  { 'nvim-treesitter/playground' },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require 'young.mod.colorizer'
    end,
  },
  -- { 'rktjmp/lush.nvim' },
  { 'RRethy/vim-illuminate', config = require 'plug-config.illuminate', event = 'BufWinEnter' },
  { 'joshdick/onedark.vim' },

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } },
    config = function()
      require('young.mod.telescope').done()
    end,
  },
  {
    'nvim-telescope/telescope-frecency.nvim',
    requires = { 'tami5/sql.nvim' },
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
    after = 'telescope.nvim',
    config = function()
      require('telescope').load_extension 'fzf'
    end,
  },
  { 'nvim-telescope/telescope-symbols.nvim' },
  {
    'nvim-telescope/telescope-packer.nvim',
    after = 'telescope.nvim',
  },
  {
    'jvgrootveld/telescope-zoxide',
    after = 'telescope.nvim',
    config = function()
      require('telescope').load_extension 'zoxide'
      require('telescope._extensions.zoxide.config').setup {
        prompt_title = '[ Z⏫ ]',
      }
    end,
  },
  {
    'AckslD/nvim-neoclip.lua',
    after = 'telescope.nvim',
    config = function()
      require('telescope').load_extension 'neoclip'
      require('neoclip').setup {
        filter = nil,
        preview = true,
        default_register = '"',
        content_spec_column = false,
        on_paste = {
          set_reg = false,
        },
        keys = {
          i = {
            select = '<cr>',
            paste = '<c-l>',
            paste_behind = '<c-h>',
          },
        },
      }
    end,
  },

  -- Web Dev
  { 'windwp/nvim-ts-autotag', ft = { 'html', 'svelte' } },

  -- Autocomplete
  {
    'hrsh7th/nvim-cmp',
    config = function()
      require('young.mod.cmp').done()
    end,
    requires = {
      -- [luasnip]
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      -- [vsnip]
      -- 'hrsh7th/cmp-vsnip',
      -- 'hrsh7th/vim-vsnip',
      -- [ultisnips]
      -- 'SirVer/ultisnips'
      -- 'quangnguyen30192/cmp-nvim-ultisnips'
      -- [source]
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-cmdline',
    },
  },
  { 'onsails/lspkind-nvim' },

  -- LSP
  { 'neovim/nvim-lspconfig' },
  { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' },
  -- { "jose-elias-alvarez/null-ls.nvim" },
  -- { "williamboman/nvim-lsp-installer" },

  -- Git
  {
    'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim',
    event = "BufRead",
    config = function()
      require('young.mod.gitsigns').done()
    end
  },

  -- Editing Enhancments
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require 'young.mod.autopairs'
    end,
  },
  {
    'folke/todo-comments.nvim',
    event = 'InsertEnter',
    requires = 'nvim-lua/plenary.nvim',
    config = require 'plug-config.todo-comments',
  },

  -- General Plugins
  {
    'ahmedkhalf/project.nvim',
    config = function()
      require 'young.mod.project'
    end,
  },
  {
    'folke/which-key.nvim',
    event = 'BufWinEnter',
    config = function()
      require('young.key.which-key').done()
    end,
  },
  {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    module = 'persistence',
    config = require 'plug-config.persistence',
  },
  { 'nvim-neorg/neorg', branch = 'unstable', config = require 'plug-config.neorg', ft = 'norg' },
  -- {
  --   'abecodes/tabout.nvim',
  --   config = function()
  --     require('tabout').setup()
  --   end,
  -- },
  { 'folke/lua-dev.nvim' },
  { 'nanotee/luv-vimdocs' },
  { 'pianocomposer321/yabs.nvim', config = require 'plug-config.yabs' },

  {
    'luukvbaal/stabilize.nvim',
    config = function()
      require('stabilize').setup()
    end,
  },

  -- Tests
  { 'edluffy/specs.nvim' },

  -- Self plugin
  -- { 'MordechaiHadad/nvim-lspmanager', config = require 'plug-config.lspmanager' },

  {
    'ZSaberLv0/ZFVimDirDiff',
    cmd = { 'ZFDirDiff', 'ZFDirDiffMark' },
    setup = function()
      vim.g.ZFDirDiffUI_dirExpandable = '+'
    end,
  },

  {
    'nathom/filetype.nvim',
    -- opt = true,
    setup = function() end,
    config = function()
      require('young.mod.filetype').done()
    end,
  },

  {
    'numToStr/Comment.nvim',
    event = 'BufRead',
    config = function()
      require 'young.mod.comment'
    end,
  },

  {
    'dstein64/vim-startuptime',
    cmd = 'StartupTime',
    setup = function()
      vim.g.startuptime_use_blocks = 0
    end,
  },

  { 'antoinemadec/FixCursorHold.nvim' }, -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open

  {
    "ibhagwan/fzf-lua",
    requires = "vijaymarupudi/nvim-fzf",
    module = 'fzf-lua',
    config = function()
      require 'young.mod.fzf'
    end,
    disable = is_windows
  },

}
