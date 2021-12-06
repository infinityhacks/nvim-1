local utils = require('young.utils')
local M = {}

setmetatable(M, {
  __index = function(t, k)
    error(k .. ' is not a valid module section!')
  end,
})

M.basic = {
  { 'wbthomason/packer.nvim' },
  { 'antoinemadec/FixCursorHold.nvim' }, -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
  {
    'nathom/filetype.nvim',
    -- opt = true,
    setup = function() end,
    config = function()
      require('young.mod.filetype').done()
    end,
  },
}

M.theme = {
  -- { 'rktjmp/lush.nvim' },

  vim = {
    'joshdick/onedark.vim',
    'sainnhe/sonokai',
    'sainnhe/edge',
    'sainnhe/everforest',
    'sainnhe/gruvbox-material',
  },

  lua = {
    {
      'shaunsingh/nord.nvim',
      setup = function()
        vim.g.nord_borders = true
      end,
    },
    'tanvirtin/monokai.nvim',
  },
}

M.appearance = {
  icon = {
    { 'kyazdani42/nvim-web-devicons' },
  },
  color = {
    {
      'norcalli/nvim-colorizer.lua',
      config = function()
        require 'young.mod.colorizer'
      end,
    },
  },
  indent = {
    {
      'lukas-reineke/indent-blankline.nvim',
      event = 'BufReadPre',
      config = function()
        require('young.mod.indent-blankline').done()
      end,
    },
  },
  line = {
    { 'RRethy/vim-illuminate', config = require 'plug-config.illuminate', event = 'BufWinEnter' },
    {
      'edluffy/specs.nvim',
      config = function()
        require('specs').setup {
          -- show_jumps  = true,
          -- min_jump = 30,
          -- popup = {
          --     delay_ms = 0, -- delay before popup displays
          --     inc_ms = 10, -- time increments used for fade/resize effects
          --     blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
          --     width = 10,
          --     winhl = "PMenu",
          --     fader = require('specs').linear_fader,
          --     resizer = require('specs').shrink_resizer
          -- },
          -- ignore_filetypes = {},
          -- ignore_buftypes = {
          --     nofile = true,
          -- },
        }
        vim.api.nvim_set_keymap('n', 'z ', ':lua require("specs").show_specs()<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'n', 'n:lua require("specs").show_specs()<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'N', 'N:lua require("specs").show_specs()<CR>', { noremap = true, silent = true })
      end,
    },
  },
}

M.motion = {
  core = {
    {
      'haya14busa/vim-asterisk',
      config = function()
        require 'young.mod.asterisk'
      end,
    },
    {
      'chaoren/vim-wordmotion',
      event = 'CursorMoved',
      setup = function()
        vim.g.wordmotion_prefix = ';'
      end,
    },
    {
      'ggandor/lightspeed.nvim',
      event = 'BufWinEnter',
      config = function()
        require 'young.mod.lightspeed'
      end,
    },
  },
  pair = {
    {
      'andymass/vim-matchup',
      event = 'CursorMoved',
      config = function()
        vim.g.matchup_matchparen_offscreen = { method = 'popup' }
      end,
    },
    -- {
    --   'abecodes/tabout.nvim',
    --   config = function()
    --     require('tabout').setup()
    --   end,
    -- },
  },
}

M.change = {
  core = {
    { 'tpope/vim-surround' },
    { 'tpope/vim-repeat' },
  },
  pair = {
    {
      'windwp/nvim-autopairs',
      event = 'InsertEnter',
      config = function()
        require 'young.mod.autopairs'
      end,
    },
  },
  comment = {
    {
      'numToStr/Comment.nvim',
      event = 'BufRead',
      config = function()
        require 'young.mod.comment'
      end,
    },
  },
  other = {
    {
      'monaqa/dial.nvim',
      event = 'BufRead',
      config = function()
        require('young.mod.dial').done()
      end,
    },
  },
}

M.BWT = {
  bufferline = {
    {
      'romgrk/barbar.nvim',
      event = 'BufWinEnter',
      config = function()
        require('young.mod.barbar').hot()
      end,
    },
  },
  window = {
    {
      'luukvbaal/stabilize.nvim',
      config = function()
        require('stabilize').setup()
      end,
    },
  },
  -- tab = {},
}

M.files = {
  project = {
    {
      'ahmedkhalf/project.nvim',
      config = function()
        require 'young.mod.project'
      end,
    },
    {
      'folke/persistence.nvim',
      event = 'BufReadPre',
      module = 'persistence',
      config = require 'plug-config.persistence',
    },
  },
  dir = {
    {
      'ZSaberLv0/ZFVimDirDiff',
      cmd = { 'ZFDirDiff', 'ZFDirDiffMark' },
      setup = function()
        vim.g.ZFDirDiffUI_dirExpandable = '+'
      end,
    },
  },
}

M.find = {
  replace = {
    {
      'windwp/nvim-spectre',
      event = 'BufRead',
      config = function()
        -- require("user.spectre").config()
      end,
    },
  },
  fzf = {
    {
      'ibhagwan/fzf-lua',
      requires = 'vijaymarupudi/nvim-fzf',
      module = 'fzf-lua',
      config = function()
        require 'young.mod.fzf'
      end,
      disable = is_windows,
    },
  },
}

M.UI = {
  core = {
    {
      'kyazdani42/nvim-tree.lua',
      event = 'BufWinEnter',
      config = function()
        require('young.mod.nvim-tree').done()
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
      'folke/trouble.nvim',
      event = 'BufRead',
      config = function()
        require('young.mod.trouble').done()
      end,
    },
  },
  statusline = {
    -- { 'NTBBloodbath/galaxyline.nvim', config = require('plug-config.galaxyline')}
    { 'nvim-lualine/lualine.nvim', config = require 'plug-config.lualine' },
  },
  terminal = {
    {
      'akinsho/toggleterm.nvim',
      event = 'BufWinEnter',
      config = function()
        require('young.mod.toggleterm').done()
      end,
    },
  },
  screen = {
    {
      'goolord/alpha-nvim',
      config = function()
        -- require('alpha').setup(require('young.mod.alpha.screen').opts)
        require('young.mod.alpha').done()
      end,
    },
  },
}

M.treesitter = {
  { 'nvim-treesitter/nvim-treesitter', config = require 'plug-config.treesitter', run = ':TSUpdate' },
  { 'nvim-treesitter/playground' },
}

M.telescope = {
  core = {
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
  },
  other = {
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
  },
}

M.code = {
  completion = {
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
  },
  -- { 'pianocomposer321/yabs.nvim', config = require 'plug-config.yabs' },
}

M.LSP = {
  core = {
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/nvim-lsp-installer' },
    -- { "jose-elias-alvarez/null-ls.nvim" },
    -- { 'MordechaiHadad/nvim-lspmanager', config = require 'plug-config.lspmanager' },
  },
  ui = {
    { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' },
  },
}

M.git = {
  {
    'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim',
    event = 'BufRead',
    config = function()
      require('young.mod.gitsigns').done()
    end,
  },
  {
    'TimUntersberger/neogit',
    cmd = 'Neogit',
    module = 'neogit',
    config = function()
      require('neogit').setup {}
    end,
  },
  -- {
  --   'tanvirtin/vgit.nvim',
  --   event = 'BufWinEnter',
  --   config = function()
  --       require('vgit').setup()
  --   end,
  --   disable = is_windows,
  -- },
}

M.neovim = {
  lua = {
    { 'folke/lua-dev.nvim' },
    { 'nanotee/luv-vimdocs' },
  },
  profile = {
    {
      'dstein64/vim-startuptime',
      cmd = 'StartupTime',
      setup = function()
        vim.g.startuptime_use_blocks = 0
      end,
    },
  },
}

M.write = {
  todo = {
    {
      'folke/todo-comments.nvim',
      event = 'InsertEnter',
      requires = 'nvim-lua/plenary.nvim',
      config = require 'plug-config.todo-comments',
    },
  },
  org = {
    { 'nvim-neorg/neorg', branch = 'unstable', config = require 'plug-config.neorg', ft = 'norg' },
  },
  markdown = {
    {
      'iamcco/markdown-preview.nvim',
      run = 'cd app && npm install',
      ft = 'markdown',
    },
  },
}

for _, module in pairs(M) do
  setmetatable(module, {
    __call = function(t)
      local plugs = {}
      for key, item in pairs(module) do
        if type(key) == "number" then
          plugs[#plugs + 1] = item
        else
          utils.append_to_list(plugs, item)
        end
      end
      return plugs
    end
  })
end

M.done = function()
  return {
    M.theme(),
    M.basic(),
    M.appearance(),
    M.motion(),
    M.change(),
    M.BWT(),
    M.files(),
    M.UI(),
    M.treesitter(),
    M.telescope(),
    M.code(),
    M.LSP(),
    M.git(),
    M.neovim(),
    M.write(),
  }
end

return M
