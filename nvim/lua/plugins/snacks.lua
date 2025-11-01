return {
  "folke/snacks.nvim",
  opts = {
    notifier = {
      timeout = 10000,
    },
    picker = {
      hidden = true,
      ignored = true,
      sources = {
        explorer = {
          hidden = true,
          ignored = true,
          layout = {
            layout = {
              position = "right",
            },
          },
          exclude = {
            ".git", -- Excludes all content within .git directories
            "node_modules", -- Excludes all content within node_modules directories
            "*.log",
          },
        },
      },
    },
    bigfile = {
      size = 1.5 * 1024 * 1024,
    },
  },
  keys = {
    {
      "<leader>fh",
      function()
        require("snacks.picker").files({ hidden = true, ignored = true })
      end,
      desc = "Find hidden files",
    },
  },
}
