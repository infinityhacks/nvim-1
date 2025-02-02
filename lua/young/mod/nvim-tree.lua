local tree_cb = require('nvim-tree.config').nvim_tree_callback

local M = {}

M.opts = {
  highlight_opened_files = 2,
  icons = {
    git = {
      unstaged = '',
      staged = '',
      deleted = '',
      untracked = '',
      unmerged = '',
      renamed = '',
      ignored = '',
    },
  },
  respect_buf_cwd = 1,
  create_in_closed_folder = 0,
  -- root_folder_modifier = ':t',
  -- TODO: not impl
  -- ignore = { '.git', 'node_modules', '.cache' },
  -- hide_dotfiles = 1,
}

-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
M.cfg = {
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = true,
  ignore_ft_on_setup = {
    'startify',
    'dashboard',
    'alpha',
  },
  auto_close = true,
  update_cwd = true, -- true good
  -- hijacks new directory buffers when they are opened
  -- disable it if using `vim-dirvish` or `lir.nvim`
  update_to_buf_dir = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = '',
      info = '',
      warning = '',
      error = '',
    },
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  git = {
    enable = true,
    ignore = true,
  },
  filters = {
    dotfiles = false,
    custom = {},
  },
  view = {
    width = 30,
    side = 'left',
    hide_root_folder = false,
    auto_resize = false, -- false good
    mappings = {
      custom_only = false,
      list = {
        { key = 'l', cb = tree_cb 'edit' },
        { key = 'h', cb = tree_cb 'close_node' },
        { key = 'u', cb = tree_cb 'parent_node' },
        { key = 'i', cb = tree_cb 'cd' },
        { key = '?', cb = tree_cb 'toggle_help' },
        { key = '.', cb = tree_cb 'toggle_dotfiles' },
      },
    },
  },
}

M.done = function()
  for opt, val in pairs(M.opts) do
    vim.g['nvim_tree_' .. opt] = val
  end

  require('young.key').leader.n.e = { '<cmd>NvimTreeToggle<CR>', 'Explorer' }
  require('nvim-tree').setup(M.cfg)
end

return M
