return {
  "catppuccin/nvim",
  lazy = true,
  name = "catppuccin",
  opts = {},
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      term_colors = true,
      lsp_styles = {
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
          ok = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
          ok = { "underline" },
        },
        inlay_hints = {
          background = true,
        },
      },
      auto_integrations = true,
      transparent_background = false, -- disables setting the background color.
      float = {
        transparent = false, -- enable transparent floating windows
        solid = false, -- use solid styling for floating windows, see |winborder|
      },
      dim_inactive = {
        enabled = true, -- dims the background color of inactive window
        shade = "light",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
    })
  end,
}
