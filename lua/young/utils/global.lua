local uv = vim.loop
local path_sep = uv.os_uname().version:match 'Windows' and '\\' or '/'

function _G.join_paths(...)
  -- local result = table.concat({ ... }, path_sep)
  local result = table.concat(vim.tbl_flatten { ... }, path_sep):gsub(path_sep .. '+', path_sep)
  return result
end

-- [](https://github.com/glepnir/nvim-lua-guide-zh#tips)
function _G.pp(...)
  local objects = vim.tbl_map(vim.inspect, { ... })
  print(table.concat(objects, '\n'))
end

function _G.ppp(...)
  local objects = {}
  for i = 1, select('#', ...) do
    local v = select(i, ...)
    table.insert(objects, vim.inspect(v))
  end

  print(table.concat(objects, '\n'))
  return ...
end
