local map = vim.keymap.set
local opts = { noremap = true, silent = true }

 map("n", ";", ":", { desc = "CMD enter command mode" })
 map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
 map("i", "jj", "<ESC>")

 map("n", "gd", vim.lsp.buf.definition, { desc = "LSP: Go to definition" })
 map("n", "grt", vim.lsp.buf.type_definition, { desc = "LSP: Type Definition" })

--keywordprg
map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- location list
map("n", "<leader>xl", function()
	local success, err = pcall(vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 and vim.cmd.lclose or vim.cmd.lopen)
	if not success and err then
		vim.notify(err, vim.log.levels.ERROR)
	end
end, { desc = "Location List" })

-- highlights under cursor
map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
map("n", "<leader>uI", "<cmd>InspectTree<cr>", { desc = "Inspect Tree" })

local function open_undotree()
	vim.cmd("packadd nvim.undotree")
	require("undotree").open()
end
map("n", "<leader>U", open_undotree, { desc = "Undo Tree" })

-- Better paste
-- remap "p" in visual mode to delete the highlighted text without overwriting your yanked/copied text, and then paste the content from the unnamed register.
map("v", "p", '"_dP', opts)

-- Toggle wrap
map("n", "<leader>tw", "<cmd>set wrap!<CR>", {
	desc = "Toggle Wrap",
	silent = true,
})

-- Fix Spell checking
map("n", "z0", "1z=", {
	desc = "Fix world under cursor",
})

