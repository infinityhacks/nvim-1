return function()
  require('persistence').setup {
    dir = vim.fn.expand(vim.fn.stdpath 'data' .. '/sessions/'), -- directory where session files are saved
    options = { 'buffers', 'curdir', 'tabpages', 'winsize' }, -- sessionoptions used for saving
  }
end
