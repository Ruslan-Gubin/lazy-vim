
local function augroup(name)
	return vim.api.nvim_create_augroup("user_" .. name, { clear = true })
end

-- Проверка изменений файла при потере/получении фокуса окна (с debounce)
local _checktime_timer = nil
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	group = augroup("checktime"),
	callback = function()
		if _checktime_timer then
			_checktime_timer:stop()
			_checktime_timer:close()
			_checktime_timer = nil
		end
		_checktime_timer = vim.defer_fn(function()
			_checktime_timer = nil
			if vim.o.buftype ~= "nofile" then
				vim.cmd("checktime")
			end
		end, 200)
	end,
})

-- Подсветка скопированного текста при нажатии y
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		(vim.hl or vim.highlight).on_yank()
	end,
})

-- Автоматическое выравнивание сплитов при изменении размера окна (с debounce 100ms)
local _resize_timer = nil
vim.api.nvim_create_autocmd({ "VimResized" }, {
	group = augroup("resize_splits"),
	callback = function()
		if _resize_timer then
			_resize_timer:stop()
			_resize_timer:close()
			_resize_timer = nil
		end
		local current_tab = vim.fn.tabpagenr()
		_resize_timer = vim.defer_fn(function()
			_resize_timer = nil
			vim.cmd("tabdo wincmd =")
			vim.cmd("tabnext " .. current_tab)
		end, 200)
	end,
})

-- Переход на последнюю позицию курсора при открытии файла
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup("last_loc"),
	callback = function(event)

		local exclude = { "gitcommit" }
		local buf = event.buf
		if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
			return
		end
		vim.b[buf].lazyvim_last_loc = true
		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Добавление дефиса в ключевые слова для CSS/SCSS/HTML (чтобы kebab-case считался одним словом)
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("iskeyword_kebab"),
	pattern = { "css", "scss", "less", "html", "htmldjango", "blade", "typescriptreact", "javascriptreact" },
	callback = function()
		vim.opt_local.iskeyword:append("-")
	end,
})

-- Файлы man не отображаются в списке буферов
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("man_unlisted"),
	pattern = { "man" },
	callback = function(event)
		vim.bo[event.buf].buflisted = false
	end,
})

-- Закрытие вспомогательных окон (help, qf, notify и др.) по нажатию q
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("close_with_q"),
	pattern = {
		"PlenaryTestPopup",
		"checkhealth",
		"dbout",
		"gitsigns-blame",
		"grug-far",
		"help",
		"lspinfo",
		"neotest-output",
		"neotest-output-panel",
		"neotest-summary",
		"notify",
		"qf",
		"spectre_panel",
		"startuptime",
		"tsplayground",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.schedule(function()
			vim.keymap.set("n", "q", function()
				vim.cmd("close")
				pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
			end, {
				buffer = event.buf,
				silent = true,
				desc = "Quit buffer",
			})
		end)
	end,
})

-- Включение переноса строк и проверки орфографии для текстовых файлов
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("wrap_spell"),
	pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- Отключение conceal для JSON файлов (все символы видны)
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = augroup("json_conceal"),
	pattern = { "json", "jsonc", "json5" },
	callback = function()
		vim.opt_local.conceallevel = 0
	end,
})

-- Автоматическое создание директорий при сохранении файла
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	group = augroup("auto_create_dir"),
	callback = function(event)
		if event.match:match("^%w%w+:[\\/][\\/]") then
			return
		end
		local file = vim.uv.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
})

-- Установка filetype=sh для .env файлов
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = augroup("env_filetype"),
	pattern = { "*.env", ".env.*" },
	callback = function()
		vim.opt_local.filetype = "sh"
	end,
})

-- Установка filetype=toml для .toml файлов
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = augroup("toml_filetype"),
	pattern = { "*.tomg-config*" },
	callback = function()
		vim.opt_local.filetype = "toml"
	end,
})

-- Установка filetype=embedded_template для .ejs файлов
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = augroup("ejs_filetype"),
	pattern = { "*.ejs", "*.ejs.t" },
	callback = function()
		vim.opt_local.filetype = "embedded_template"
	end,
})

-- Установка filetype=json для .code-snippets файлов
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = augroup("code_snippets_filetype"),
	pattern = { "*.code-snippets" },
	callback = function()
		vim.opt_local.filetype = "json"
	end,
})

