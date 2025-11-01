return {
  "lewis6991/gitsigns.nvim",
  opts = {
    current_line_blame = true,
    current_line_blame_opts = {
      delay = 500,
      virt_text_pos = "eol",
    },
    on_attach = function(bufnr)
      local gs = require("gitsigns")
      vim.keymap.set("n", "<leader>hb", function()
        gs.blame_line({ full = true })
      end, { buffer = bufnr, desc = "Git blame line" })
    end,
  },
}
