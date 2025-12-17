-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/n45371/.cache/nvim/packer_hererocks/2.1.1764270282/share/lua/5.1/?.lua;/Users/n45371/.cache/nvim/packer_hererocks/2.1.1764270282/share/lua/5.1/?/init.lua;/Users/n45371/.cache/nvim/packer_hererocks/2.1.1764270282/lib/luarocks/rocks-5.1/?.lua;/Users/n45371/.cache/nvim/packer_hererocks/2.1.1764270282/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/n45371/.cache/nvim/packer_hererocks/2.1.1764270282/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["kanagawa.nvim"] = {
    loaded = true,
    path = "/Users/n45371/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nƒ\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\ffilters\1\0\1\rdotfiles\1\rrenderer\1\0\1\16group_empty\2\tview\1\0\1\nwidth\3\30\1\0\4\rrenderer\0\tview\0\ffilters\0\fsort_by\19case_sensitive\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/Users/n45371/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/n45371/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/n45371/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/n45371/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/n45371/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/n45371/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nJ\0\1\4\1\4\0\t-\1\0\0009\1\0\1\18\3\0\0B\1\2\0016\1\1\0009\1\2\1'\3\3\0B\1\2\1K\0\1\0\2¿\ncopen\bcmd\bvim\19send_to_qflist∆\3\1\0\v\0\24\0%6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0\29Ä6\2\1\0'\4\3\0B\2\2\0023\3\4\0009\4\5\0015\6\20\0005\a\6\0005\b\a\0=\b\b\a5\b\15\0005\t\n\0009\n\t\2=\n\v\t9\n\f\2=\n\r\t=\3\14\t=\t\16\b5\t\17\0=\3\14\t=\t\18\b=\b\19\a=\a\21\6B\4\2\0016\4\0\0009\6\22\1'\a\23\0B\4\3\0012\0\0ÄK\0\1\0K\0\1\0\bfzf\19load_extension\rdefaults\1\0\1\rdefaults\0\rmappings\6n\1\0\1\n<C-q>\0\6i\1\0\2\6i\0\6n\0\n<C-q>\n<C-k>\28move_selection_previous\n<C-j>\1\0\3\n<C-k>\0\n<C-q>\0\n<C-j>\0\24move_selection_next\17path_display\1\2\0\0\nsmart\1\0\4\17path_display\0\18prompt_prefix\nüîç \rmappings\0\20selection_caret\t‚û§ \nsetup\0\22telescope.actions\14telescope\frequire\npcall\0" },
    loaded = true,
    path = "/Users/n45371/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nJ\0\1\4\1\4\0\t-\1\0\0009\1\0\1\18\3\0\0B\1\2\0016\1\1\0009\1\2\1'\3\3\0B\1\2\1K\0\1\0\2¿\ncopen\bcmd\bvim\19send_to_qflist∆\3\1\0\v\0\24\0%6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0\29Ä6\2\1\0'\4\3\0B\2\2\0023\3\4\0009\4\5\0015\6\20\0005\a\6\0005\b\a\0=\b\b\a5\b\15\0005\t\n\0009\n\t\2=\n\v\t9\n\f\2=\n\r\t=\3\14\t=\t\16\b5\t\17\0=\3\14\t=\t\18\b=\b\19\a=\a\21\6B\4\2\0016\4\0\0009\6\22\1'\a\23\0B\4\3\0012\0\0ÄK\0\1\0K\0\1\0\bfzf\19load_extension\rdefaults\1\0\1\rdefaults\0\rmappings\6n\1\0\1\n<C-q>\0\6i\1\0\2\6i\0\6n\0\n<C-q>\n<C-k>\28move_selection_previous\n<C-j>\1\0\3\n<C-k>\0\n<C-q>\0\n<C-j>\0\24move_selection_next\17path_display\1\2\0\0\nsmart\1\0\4\17path_display\0\18prompt_prefix\nüîç \rmappings\0\20selection_caret\t‚û§ \nsetup\0\22telescope.actions\14telescope\frequire\npcall\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nƒ\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\ffilters\1\0\1\rdotfiles\1\rrenderer\1\0\1\16group_empty\2\tview\1\0\1\nwidth\3\30\1\0\4\rrenderer\0\tview\0\ffilters\0\fsort_by\19case_sensitive\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
