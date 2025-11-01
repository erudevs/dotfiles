local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Remap ESC to Capslock
keymap.set("n", "<Capslock>", "<Esc>", opts)

-- Do things without affecting the registers
keymap.set("n", "x", '"_x')
keymap.set("n", "<Leader>p", '"0p')
keymap.set("n", "<Leader>P", '"0P')
keymap.set("v", "<Leader>p", '"0p')
keymap.set("n", "<Leader>c", '"_c')
keymap.set("n", "<Leader>C", '"_C')
keymap.set("v", "<Leader>c", '"_c')
keymap.set("v", "<Leader>C", '"_C')
keymap.set("n", "<Leader>d", '"_d')
keymap.set("n", "<Leader>D", '"_D')
keymap.set("v", "<Leader>d", '"_d')
keymap.set("v", "<Leader>D", '"_D')

-- Disable the spacebar key's default behavior in Normal and Visual modes
keymap.set({ "n", "v" }, "<Space>", "<Nop>", opts)

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", "vb_d")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Jumplist
keymap.set("n", "<C-m", "<C-i>")

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Toggle line wrapping
keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

-- Press jk fast to exit insert mode
keymap.set("i", "jk", "<ESC>", opts)
keymap.set("i", "kj", "<ESC>", opts)

-- Stay in indent mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- Move text up and down
keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)
keymap.set("v", "<A-k>", ":m .-2<CR>==", opts)

-- Keep last yanked when pasting
keymap.set("v", "p", '"_dP', opts)

-- Replace word under cursor
keymap.set("n", "<leader>j", "*``cgn", opts)

-- Explicitly yank to system clipboard (highlighted and entire row)
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

-- Diagnostic keymaps
keymap.set("n", "<leader>dn", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Go to previous diagnostic message" })
keymap.set("n", "<leader>dp", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Go to next diagnostic message" })
keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Save and load session
keymap.set("n", "<leader>ss", ":mksession! .session.vim<CR>", { noremap = true, silent = false })
keymap.set("n", "<leader>sl", ":source .session.vim<CR>", { noremap = true, silent = false })

-- Search exact (\V = very nomagic)
vim.keymap.set("n", "/se", function()
  local input = vim.fn.input("Search exact: ")
  if input ~= "" then
    vim.fn.setreg("/", "\\V" .. input)
    vim.opt.hlsearch = true
  end
end, { desc = "Search exact (\\V)" })

-- Find and replace in current file
vim.keymap.set("n", "/sr", function()
  local find = vim.fn.input("Find: ")
  if find == "" then
    return
  end
  local replace = vim.fn.input("Replace with: ")
  if replace == "" then
    return
  end
  -- ganti ke find..replace sesuai kebutuhan
  vim.cmd(string.format("%%s/\\V%s/%s/gc", vim.fn.escape(find, "/\\"), replace))
end, { desc = "Find & Replace current file" })

-- tampilkan diagnostic lengkap untuk baris saat ini
vim.keymap.set("n", "<leader>de", function()
  vim.diagnostic.open_float(nil, {
    focus = false,
    scope = "line",
    border = "rounded",
    source = "always",
  })
end, { desc = "Show full diagnostic message" })

vim.diagnostic.config({
  float = {
    border = "rounded",
    focusable = true,
    source = "always",
    header = "",
    prefix = "",
  },
})
