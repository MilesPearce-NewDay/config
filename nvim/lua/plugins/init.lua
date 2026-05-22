return {
  -- colorscheme
  {
    "rebelot/kanagawa.nvim",
    config = function()
      vim.cmd([[colorscheme kanagawa]])
    end,
  },

  -- completion (delegates to complete.lua for config)
  { import = "plugins.complete" },

  -- copilot plugin (copilot.lua exists)
  { import = "plugins.copilot" },
}
