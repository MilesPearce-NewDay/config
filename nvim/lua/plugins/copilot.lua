return {
  "zbirenbaum/copilot.lua",
  enabled = true,
  event = "InsertEnter",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = { accept = "<C-y>" },
    },
    panel = { enabled = false },
    copilot_node_command = "node", -- adjust if node is elsewhere
    -- accept suggestion with <C-y>
  },
}
