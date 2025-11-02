-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- LSP Server to use for PHP.
-- Set to "intelephense" to use intelephense instead of phpactor.
vim.g.lazyvim_php_lsp = "intelephense"
vim.opt.exrc = true
vim.opt.secure = true

-- NEOVIDE CONFIG
if vim.g.neovide then
  vim.o.guifont = "MesloLGL Nerd Font:h11"

  vim.g.neovide_cursor_animation_length = 0.08
  vim.g.neovide_cursor_trail_length = 0.5
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_vfx_mode = "railgun" -- railgun | ripple | sonicboom | torpedo | pixiedust

  vim.g.neovide_opacity = 1
  vim.g.neovide_background_color = "#1e1e2e" .. string.format("%x", math.floor(255 * 0.96))

  vim.g.neovide_fullscreen = false

  vim.g.neovide_scale_factor = 1.0

  local function toggle_transparency()
    if vim.g.neovide_opacity == 1 then
      vim.g.neovide_opacity = 0.97
      vim.g.neovide_background_color = "#1e1e2e" .. string.format("%x", math.floor(255 * 0.9))
      vim.notify("🫧 Transparency ON (90%)", vim.log.levels.INFO)
    else
      vim.g.neovide_opacity = 1
      vim.g.neovide_background_color = "#1e1e2e" .. "ff"
      vim.notify("🧱 Transparency OFF", vim.log.levels.INFO)
    end
  end

  local function toggle_fullscreen()
    vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
    if vim.g.neovide_fullscreen then
      vim.notify("🖥️  Fullscreen ON", vim.log.levels.INFO)
    else
      vim.notify("🪟 Windowed mode", vim.log.levels.INFO)
    end
  end

  vim.keymap.set("n", "<leader>tf", toggle_fullscreen, { desc = "Toggle Fullscreen" })
  vim.keymap.set("n", "<leader>tt", toggle_transparency, { desc = "Toggle Transparency" })
end

if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = true,
  }
  -- This ensures Neovim uses the clipboard register automatically
  vim.opt.clipboard = "unnamedplus"
end
