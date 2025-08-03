-- Example: after/plugin/vim_visual_multi.lua

-- Use Vim commands because the plugin is not Lua-native
vim.cmd([[
  let g:VM_default_mappings = 1
  let g:VM_maps = {}
  let g:VM_maps["Find Under"]         = "<C-n>"
  let g:VM_maps["Find Subword Under"] = "<C-n>"
  let g:VM_maps["Add Cursor Down"]    = "<C-Down>"
  let g:VM_maps["Add Cursor Up"]      = "<C-Up>"
  let g:VM_maps["Skip Region"]        = "gs"
  let g:VM_maps["Remove Region"]      = "gR"
]])

-- Optional: Adjust visuals
vim.cmd([[
  let g:VM_set_statusline = 0
  let g:VM_show_warnings = 0
]])

