return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })

      opts.presets.lsp_doc_border = true
    end,
  },

  -- buffer line
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    -- opts = {
    --   options = {
    --     mode = "tabs",
    --     -- separator_style = "slant",
    --     show_buffer_close_icons = false,
    --     show_close_icon = false,
    --   },
    -- },
  },

  -- filename
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    priority = 1200,
    dependencies = { "SmiteshP/nvim-navic", "nvim-tree/nvim-web-devicons" },
    config = function()
      local helpers = require("incline.helpers")
      local navic = require("nvim-navic")
      local devicons = require("nvim-web-devicons")

      require("incline").setup({
        window = {
          padding = 0,
          margin = { horizontal = 0, vertical = 0 },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if filename == "" then
            filename = "[No Name]"
          end

          local hl = vim.api.nvim_get_hl(0, { name = "StatusLine" })
          local bg_color = hl.bg and string.format("#%06x", hl.bg)

          local ft_icon, ft_color = devicons.get_icon_color(filename)
          local modified = vim.bo[props.buf].modified
          local res = {
            ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
            " ",
            { filename, gui = modified and "bold,italic" or "bold" },
            guibg = bg_color,
          }
          if props.focused then
            for _, item in ipairs(navic.get_data(props.buf) or {}) do
              table.insert(res, {
                { " > ", group = "NavicSeparator" },
                { item.icon, group = "NavicIcons" .. item.type },
                { item.name, group = "NavicText" },
              })
            end
          end
          table.insert(res, " ")
          return res
        end,
      })
    end,
  },

  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
 █████╗ ██╗  ██╗███╗   ███╗██████╗ ██╗  ██╗███╗   ██╗██████╗ ██████╗ 
██╔══██╗██║  ██║████╗ ████║██╔══██╗██║  ██║████╗  ██║██╔══██╗██╔══██╗
███████║███████║██╔████╔██║██║  ██║███████║██╔██╗ ██║██║  ██║██████╔╝
██╔══██║██╔══██║██║╚██╔╝██║██║  ██║██╔══██║██║╚██╗██║██║  ██║██╔══██╗
██║  ██║██║  ██║██║ ╚═╝ ██║██████╔╝██║  ██║██║ ╚████║██████╔╝██║  ██║
╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝
]],
        },
      },
    },
  },
}
