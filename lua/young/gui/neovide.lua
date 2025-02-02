-- <https://github.com/neovide/neovide/wiki/Configuration>

local M = {}

local gmap = require 'young.gui.map'
local font = require 'young.gui.font'
local tran = require 'young.gui.transparency'

local cur_idx = 1
local cursor_modes = {
  'railgun', -- 泡泡
  'torpedo', -- 水雷
  'pixiedust', -- 精灵
  'sonicboom', -- 音速轰
  'ripple', -- 涟漪
  'wireframe', -- 线框
}

function M.toggle_fullscreen()
  -- vim.g doesn't work
  vim.cmd 'let g:neovide_fullscreen = !g:neovide_fullscreen'
end

function M.adjust_transparency(num)
  tran.adjust(num)
  -- vim.g doesn't work
  vim.cmd('let g:neovide_transparency = ' .. tran.val)
end

function M.switch_effect()
  cur_idx = cur_idx % #cursor_modes
  cur_idx = cur_idx + 1
  -- vim.g doesn't work
  vim.cmd('let g:neovide_cursor_vfx_mode = "' .. cursor_modes[cur_idx] .. '"')
  M.post_effect()
end

function M.post_effect()
  local msg = '[Effect]: ' .. cursor_modes[cur_idx]
  vim.notify(msg)
end

-- FIX: <https://github.com/neovide/neovide/issues/1037>
function M.toggle_ligature() end

M.once = function()
  vim.cmd 'let g:neovide_cursor_animation_length = 0.2' -- vim.g doesn't work
  vim.g.neovide_cursor_vfx_mode = cursor_modes[cur_idx]
  vim.g.neovide_cursor_animation_length = 0.3 -- the time it takes for the cursor to complete it's animation in seconds.
  vim.g.neovide_cursor_trail_length = 0.1 -- how much the trail of the cursor lags behind the front edge.
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_vfx_opacity = 200.0 -- the transparency of the generated particles.
  vim.g.neovide_cursor_vfx_particle_lifetime = 1.2 -- the amount of time the generated particles should survive.
  vim.g.neovide_cursor_vfx_particle_density = 10.0 -- the number of generated particles.
  vim.g.neovide_cursor_vfx_particle_speed = 10.0 -- the speed of particle movement.
  vim.g.neovide_no_idle = true
  vim.g.neovide_refresh_rate = 60
end

-- M.hot = function()
--   local nmap = require('young.key').nmap

--   -- mouse wheel doesn't work
--   -- nmap('<C-ScrollWheelUp>', "<Cmd>silent! lua require'young.gui.neovide'.adjust_fontsize(1)<CR>")
--   -- nmap('<C-ScrollWheelDown>', "<Cmd>silent! lua require'young.gui.neovide'.adjust_fontsize(-1)<CR>")
--   -- nmap('<C-ScrollWheelUp>', "<Cmd>silent! lua require'young.gui.neovide'.adjust_fontsize(1)<CR>")
--   -- nmap('<C-ScrollWheelDown>', "<Cmd>silent! lua require'young.gui.neovide'.adjust_fontsize(-1)<CR>")

--   nmap('<F8>', "<Cmd>lua require'young.gui.neovide'.adjust_fontsize(-1)<CR>")
--   nmap('<F9>', "<Cmd>lua require'young.gui.neovide'.adjust_fontsize(+1)<CR>")
--   nmap('<F10>', "<Cmd>lua require'young.gui.neovide'.switch_font()<CR>")
--   nmap('<F11>', "<Cmd>lua require'young.gui.neovide'.toggle_fullscreen()<CR>")
-- end

M.config = function()
  M.once()
  -- M.hot()
  font.once('delu_l', 16)
  gmap.toggle_fullscreen = M.toggle_fullscreen
  gmap.adjust_transparency = M.adjust_transparency
  gmap.switch_effect = M.switch_effect
end

return M
