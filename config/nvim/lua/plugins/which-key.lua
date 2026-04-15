return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
        { "<leader>d", desc = "   Diagnostics" },
        { "<leader>p", desc = "   Project" },
        { "<leader>h", desc = " 󰛢 Harpoon" },
        { "<leader>x", desc = "  Trouble" },
        { "<leader>f", desc = "  Format" },
    }
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
