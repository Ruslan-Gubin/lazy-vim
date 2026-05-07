
local darkText = "#292623"

local palettes = {
	dark = {
		rosewater = "#f7768e",
		flamingo = "#f7768e",
		maroon = "#f7768e",
		pink = "#bb9af7",
		mauve = "#bb9af7",
		peach = "#ff9e64",
		teal = "#7dcfff",
		sky = "#7dcfff",
		sapphire = "#7dcfff",
		lavender = "#bb9af7",
		text = "#c0caf5",
		subtext2 = "#a9b1d6",
		subtext1 = "#a9b1d6",
		subtext0 = "#7982a9",
		overlay2 = "#565f89",
		overlay1 = "#414868",
		overlay0 = "#2f334d",
		surface2 = "#24283b",
		surface1 = "#1f2335",
		surface0 = "#1a1b26",
		mantle = "#16161e",
		crust = "#11111b",
		none = "NONE",

    yellow   = '#ECBE7B',
    cyan     = '#008080',
    darkblue = '#081633',
    green    = '#98be65',
    orange   = '#FF8800',
    violet   = '#a9a1e1',
    magenta  = '#c678dd',
    blue     = '#51afef',
    red      = '#ec5f67',

    -- background
		base = "#151a1e", 
    -- ? : == !== > < + -
    operator = "#5d8957",
    -- () {} []
    bracket = "#fcd247",
    -- ;
    delimiter = "#081633", -- "#a2a2a3"
    funCall = "#ECBE7B", -- "#f0be6e"
    keyword = "#FF8800", -- "#d97934"
    property = "#a9a1e1", -- "#c678dd" "#bd87c9"
    string = "#5d8957", -- "#008080"
    constantBuiltin = "#51afef", -- "#937dff"
    number = "#51afef", -- "#99c2ff"
    variable = "#dedede" -- "#dedede",
	},
  light = {
    -- background
		base = "#f4f1ea",
    -- ? : == !== > < + -
    operator = darkText,
    -- () {} []
    bracket = darkText,
    -- ;
    delimiter = darkText, -- "#a2a2a3"
    funCall = darkText, -- "#f0be6e"
    keyword = darkText, -- "#d97934"
    property = darkText, -- "#c678dd" "#bd87c9"
    string = darkText, -- "#008080"
    constantBuiltin = darkText, -- "#937dff"
    number = darkText, -- "#99c2ff"
    variable = darkText, -- "#dedede",
  }
}

local function apply_custom_highlights()
	local flavor = vim.g.custom_theme_flavour or "dark"
	local colors = palettes[flavor] or palettes.dark

	local highlights = {
		Normal = { fg = colors.text, bg = colors.base },
		NormalNC = { fg = colors.text, bg = colors.base },

		["@lsp.type.function.typescriptreact"] = { fg = colors.funCall },
		["@keyword.tsx"] = { fg = colors.keyword },
		["@keyword.import.tsx"] = { fg = colors.keyword },
		["@string.tsx"] = { fg = colors.string },
		["@lsp.type.property.typescriptreact"] = { fg = colors.property },
		["@lsp.type.type.typescriptreact"] = { fg = colors.funCall },
		["@lsp.type.interface.typescriptreact"] = { fg = colors.funCall },
		["@type.builtin.tsx"] = { fg = colors.funCall },
		["@punctuation.bracket.tsx"] = { fg = colors.bracket },
		["@keyword.repeat.tsx"] = { fg = colors.keyword },
		["@keyword.operator.tsx"] = { fg = colors.keyword },
		["@operator.tsx"] = { fg = colors.operator },
		["@keyword.conditional.tsx"] = { fg = colors.keyword },
		["@lsp.type.class.typescriptreact"] = { fg = colors.funCall },
		["@number.tsx"] = { fg = colors.number },
		["@keyword.conditional.ternary.tsx"] = { fg = colors.operator },
		["@keyword.return.tsx"] = { fg = colors.keyword },
		["@tag.builtin.tsx"] = { fg = colors.funCall },
		["@tag.delimiter.tsx"] = { fg = colors.funCall },
		["@variable.member.tsx"] = { fg = colors.property },
		["@tag.attribute.tsx"] = { fg = colors.variable },
		["@tag.tsx"] = { fg = colors.funCall },
		["@constant.builtin.tsx"] = { fg = colors.constantBuiltin },
		["@property.css"] = { fg = colors.property },
		["@type.css"] = { fg = colors.funCall },
		["@number.css"] = { fg = colors.number },
		["@string.css"] = { fg = colors.funCall },
		["@punctuation.bracket.css"] = { fg = colors.bracket },
		["@function.css"] = { fg = colors.funCall },
		["@keyword.directive.css"] = { fg = colors.keyword },
		["@number.float.css"] = { fg = colors.number },
		["@keyword.function.tsx"] = { fg = colors.keyword },
		["@keyword.coroutine.tsx"] = { fg = colors.keyword },
		["@keyword.import.typescript"] = { fg = colors.keyword },
		["@keyword.type.typescript"] = { fg = colors.keyword },
		["@keyword.typescript"] = { fg = colors.keyword },
		["@lsp.type.function.typescript"] = { fg = colors.funCall },
		["@keyword.coroutine.typescript"] = { fg = colors.keyword },
		["@type.builtin.typescript"] = { fg = colors.funCall },
		["@lsp.type.property.typescript"] = { fg = colors.property },
		["@constant.builtin.typescript"] = { fg = colors.funCall },
		["@lsp.type.method.typescriptreact"] = { fg = colors.funCall },
		["@lsp.type.method.typescript"] = { fg = colors.property },
		["@operator.typescript"] = { fg = colors.operator },
		["@lsp.type.interface.typescript"] = { fg = colors.funCall },
		["@string.typescript"] = { fg = colors.string },
		["@keyword.conditional.ternary.typescript"] = { fg = colors.string },
		["@punctuation.bracket.typescript"] = { fg = colors.bracket },
		["@lsp.type.class.typescript"] = { fg = colors.funCall },
		["@keyword.return.typescript"] = { fg = colors.keyword },
		["@keyword.conditional.typescript"] = { fg = colors.keyword },
		["@tag.css"] = { fg = colors.funCall },
		["@tag.attribute.css"] = { fg = colors.variable },
		["@string.regexp.typescript"] = { fg = colors.operator },
		["@number.typescript"] = { fg = colors.number },
		["@ibl.scope.underline.1"] = { fg = colors.funCall },
		["@lsp.type.type.typescript"] = { fg = colors.funCall },
		["@variable.builtin.typescript"] = { fg = colors.variable },
		["@constructor.typescript"] = { fg = colors.variable },
		["@keyword.exception.typescript"] = { fg = colors.keyword },
		["@lsp.type.variable.typescriptreact"] = { fg = colors.variable },
		["@function.tsx"] = { fg = colors.funCall },
		["@function.method.tsx"] = { fg = colors.funCall },
		["@variable.member.typescript"] = { fg = colors.property },
		["@type.typescript"] = { fg = colors.funCall },
		["@function.call.tsx"] = { fg = colors.funCall },
		["@type.tsx"] = { fg = colors.funCall },
		["@variable.tsx"] = { fg = colors.variable },
		["@function.method.call.tsx"] = { fg = colors.funCall },
		["@function.javascript"] = { fg = colors.funCall },
		["@lsp.type.function.javascript"] = { fg = colors.funCall },
		["@function.call.javascript"] = { fg = colors.funCall },
		["@keyword.import.javascript"] = { fg = colors.keyword },
		["@number.javascript"] = { fg = colors.number },
		["@function.method.call.javascript"] = { fg = colors.funCall },
		["@lsp.type.method.javascript"] = { fg = colors.funCall },
		["@variable.builtin.javascript"] = { fg = colors.variable },
		["@operator.javascript"] = { fg = colors.operator },
		["@punctuation.bracket.javascript"] = { fg = colors.bracket },
		["@constant.builtin.javascript"] = { fg = colors.property },
		["@keyword.return.javascript"] = { fg = colors.keyword },
		["@keyword.javascript"] = { fg = colors.keyword },
		["@keyword.conditional.javascript"] = { fg = colors.keyword },
		["@variable.builtin.tsx"] = { fg = colors.variable },
		["@type.builtin.javascript"] = { fg = colors.variable },
		["@lsp.type.namespace.typescriptreact"] = { fg = colors.funCall },
		["@string.javascript"] = { fg = colors.string },
		["@function.method.typescript"] = { fg = colors.property },
		["@function.call.typescript"] = { fg = colors.funCall },
		["@function.method.call.typescript"] = { fg = colors.property },
		["@attribute.typescript"] = { fg = colors.funCall },

		["@punctuation.delimiter.css"] = { fg = colors.delimiter },
		["@punctuation.delimiter.typescript"] = { fg = colors.delimiter },
		["@spell.tsx"] = { fg = colors.delimiter },
		["@punctuation.special.tsx"] = { fg = colors.delimiter },
		["@markup.heading.3.tsx"] = { fg = colors.delimiter },
		["@markup.heading.2.tsx"] = { fg = colors.delimiter },
		["@punctuation.special.typescript"] = { fg = colors.delimiter },
		["@attribute.css"] = { fg = colors.delimiter },

		["@punctuation.delimiter.tsx"] = { fg = colors.delimiter },
		["@punctuation.delimiter.javascript"] = { fg = colors.delimiter },
		-- [""] = { fg = "" },
		-- [""] = { fg = "" },
		-- [""] = { fg = "" },
		-- [""] = { fg = "" },
		-- [""] = { fg = "" },
		-- [""] = { fg = "" },




		-- Элементы пользовательского интерфейса (строка состояния, меню, поиск и т.д.)
		-- CmpItemMenu = { fg = colors.surface2 },
		-- CursorLineNr = { fg = colors.text, bold = true },
		-- FloatBorder = { bg = colors.base, fg = colors.surface0 },
		-- NormalFloat = { fg = colors.text, bg = colors.base },
		-- LineNr = { fg = colors.overlay0 },
		-- LspInfoBorder = { link = "FloatBorder" },
		-- Pmenu = { bg = colors.mantle, fg = colors.text },
		-- PmenuSel = { bg = colors.surface0, fg = colors.text },
		-- Question = { fg = colors.blue },
		-- WarningMsg = { fg = colors.yellow },
		-- ErrorMsg = { fg = colors.blue },
		-- YankHighlight = { bg = colors.surface2 },
		-- VertSplit = { bg = colors.none, fg = colors.surface0 },
		-- Visual = { bg = colors.surface1 },
		-- Search = { bg = colors.surface1, fg = colors.text },
		-- CurSearch = { bg = colors.yellow, fg = colors.base },
		-- Directory = { fg = colors.blue, bold = true },
		-- NonText = { fg = colors.surface2 },
		-- SpecialKey = { fg = colors.surface2 },

		-- Плагин: Snacks (файловые меню, уведомления и т.д.)
		-- SnacksBackdrop = { bg = "#000000" },
		-- SnacksNormal = { link = "NormalFloat" },
		-- SnacksPicker = { link = "NormalFloat" },
		-- SnacksPickerBorder = { link = "FloatBorder" },
		-- SnacksPickerList = { bg = colors.mantle, fg = colors.text },
		-- SnacksPickerPreview = { bg = colors.crust, fg = colors.text },
		-- SnacksPickerPreviewBorder = { bg = colors.crust, fg = colors.crust },
		-- SnacksPickerInput = { bg = colors.surface0, fg = colors.text },
		-- SnacksPickerInputBorder = { bg = colors.surface0, fg = colors.surface0 },
		-- SnacksPickerTitle = { fg = colors.mauve, bold = true },
		-- SnacksPickerMatch = { fg = colors.blue, bold = true },
		-- SnacksPickerLabel = { fg = colors.overlay1 },
		-- SnacksPickerDirectory = { fg = colors.subtext1 },
		-- SnacksPickerSelection = { bg = colors.surface0, bold = true },
		-- SnacksPickerRow = { bg = colors.mantle },

		-- Плагин: WhichKey (подсказки сочетаний клавиш)
		-- WhichKey = { fg = colors.pink },
		-- WhichKeyGroup = { fg = colors.blue },
		-- WhichKeySeparator = { fg = colors.overlay1 },
		-- WhichKeyDesc = { fg = colors.teal },
		-- WhichKeyFloat = { bg = colors.mantle },
		-- WhichKeyValue = { fg = colors.overlay1 },

		-- Плагин: Telescope (поиск файлов, текста и т.д.)
		-- TelescopeNormal = { link = "NormalFloat" },
		-- TelescopeBorder = { link = "FloatBorder" },
		-- TelescopePreviewBorder = { bg = colors.crust, fg = colors.crust },
		-- TelescopePreviewNormal = { bg = colors.crust },
		-- TelescopePreviewTitle = { fg = colors.crust, bg = colors.crust },
		-- TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
		-- TelescopePromptCounter = { fg = colors.mauve, bold = true },
		-- TelescopePromptNormal = { bg = colors.surface0 },
		-- TelescopePromptPrefix = { bg = colors.surface0 },
		-- TelescopePromptTitle = { fg = colors.surface0, bg = colors.surface0 },
		-- TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
		-- TelescopeResultsNormal = { bg = colors.mantle },
		-- TelescopeResultsTitle = { fg = colors.mantle, bg = colors.mantle },
		-- TelescopeSelection = { bg = colors.surface0 },

		-- Плагин: NeoTree (файловое дерево)
		NeoTreeDirectoryIcon = { fg = '#dedede' },
		NeoTreeDirectoryName = { fg = "#dedede" },
		-- NeoTreeFloatBorder = { link = "TelescopeResultsBorder" },
		-- NeoTreeGitConflict = { fg = colors.red },
		-- NeoTreeGitDeleted = { fg = colors.red },
		-- NeoTreeGitIgnored = { fg = colors.overlay0 },
		-- NeoTreeGitModified = { fg = colors.peach },
		-- NeoTreeGitStaged = { fg = colors.green },
		-- NeoTreeGitUnstaged = { fg = colors.red },
		-- NeoTreeGitUntracked = { fg = colors.green },
		-- NeoTreeIndent = { fg = colors.surface1 },
		NeoTreeNormal = { bg = colors.base, fg = colors.text },
		NeoTreeNormalNC = { bg = colors.base, fg = colors.text },
		NeoTreeRootName = { fg = '#dedede', bold = true },
		-- NeoTreeTabActive = { fg = colors.text, bg = colors.mantle },
		-- NeoTreeTabInactive = { fg = colors.surface2, bg = colors.crust },
		-- NeoTreeTabSeparatorActive = { fg = colors.mantle, bg = colors.mantle },
		-- NeoTreeTabSeparatorInactive = { fg = colors.crust, bg = colors.crust },
		-- NeoTreeWinSeparator = { fg = colors.base, bg = colors.base },
		--
		-- Прочие плагины (Fidget, GitSigns, BlinkCmp и др.)
		-- FidgetTask = { fg = colors.subtext2 },
		-- FidgetTitle = { fg = colors.peach, bold = true },
		-- IblIndent = { fg = colors.surface0 },
		-- IblScope = { fg = colors.overlay0 },
		-- GitSignsChange = { fg = colors.peach },
		-- GitSignsAdd = { fg = colors.green },
		-- GitSignsDelete = { fg = colors.red },
		-- BlinkCmpLabelMatch = { fg = colors.blue, bold = true },
		-- FlashMatch = { bg = colors.mauve, fg = colors.base },
		-- FlashLabel = { bg = colors.peach, fg = colors.base, bold = true },
		-- NoiceLspProgressTitle = { fg = colors.peach, bold = true },
		-- YankyYanked = { bg = colors.surface2 },
		--
		-- Отладчик (DAP)
		-- DapBreakpoint = { fg = colors.red },
		-- DapStopped = { fg = colors.green },
		-- DapLogPoint = { fg = colors.yellow },

		-- Диагностика (ошибки, предупреждения, подчеркивания)
		-- DiagnosticError = { fg = colors.red },
		-- DiagnosticWarn = { fg = colors.yellow },
		-- DiagnosticInfo = { fg = colors.sky },
		-- DiagnosticHint = { fg = colors.teal },
		-- DiagnosticUnderlineError = { sp = colors.red, undercurl = true },
		-- DiagnosticUnderlineWarn = { sp = colors.yellow, undercurl = true },
		-- DiagnosticUnderlineInfo = { sp = colors.sky, undercurl = true },
		-- DiagnosticUnderlineHint = { sp = colors.teal, undercurl = true },
		-- DiagnosticUnnecessary = { fg = colors.overlay0, undercurl = true },

		-- Синтаксис (общие правила, закомментированы для справки)
		-- Identifier = { fg = colors.text },
		-- Базовые группы синтаксиса (активные)
		-- Boolean = { fg = colors.mauve },
		-- Number = { fg = colors.mauve },
		-- Float = { fg = colors.mauve },
		-- PreProc = { fg = colors.mauve },
		-- PreCondit = { fg = colors.mauve },
		-- Include = { fg = colors.mauve },
		-- Define = { fg = colors.mauve },
		-- Conditional = { fg = colors.red },
		-- Repeat = { fg = colors.red },
		-- Keyword = { fg = colors.red },
		-- Typedef = { fg = colors.red },
		-- Exception = { fg = colors.red },
		-- Statement = { fg = colors.red },
		-- Error = { fg = colors.red },
		-- StorageClass = { fg = colors.peach },
		-- Tag = { fg = colors.peach },
		-- Label = { fg = colors.peach },
		-- Structure = { fg = colors.peach },
		-- Operator = { fg = colors.peach },
		-- Title = { fg = colors.peach, bold = true },
		-- Special = { fg = colors.yellow },
		-- SpecialChar = { fg = colors.yellow },
		-- Type = { fg = colors.yellow, bold = true },
		-- Function = { fg = colors.green, bold = true },
		-- Delimiter = { fg = colors.subtext2 },
		-- Ignore = { fg = colors.subtext2 },
		-- Macro = { fg = colors.teal },
		-- String = { fg = colors.teal },
		-- Comment = { fg = colors.overlay1, italic = true },

		-- Treesitter и LSP подсветка (закомментировано для справки)
		-- ["@variable"] = { fg = colors.text },
		-- ["@variable.builtin"] = { fg = colors.red },
		-- ["@variable.parameter"] = { fg = colors.text },
		-- ["@variable.member"] = { fg = colors.blue },
		-- ["@property"] = { fg = colors.blue },
		-- ["@field"] = { fg = colors.blue },
		-- ["@parameter"] = { fg = colors.text },
		-- ["@constant"] = { fg = colors.text },
		-- ["@constant.builtin"] = { fg = colors.mauve },
		-- ["@constructor"] = { fg = colors.green, bold = true },
		-- ["@module"] = { fg = colors.yellow },
		-- ["@namespace"] = { fg = colors.yellow },
		-- ["@label"] = { fg = colors.peach },
		-- ["@attribute"] = { fg = colors.mauve },
		--   ["@none"] = { fg = colors.text },

		-- Специфичные языковые конструкции (HTML теги и др.)
		-- ["@tag"] = { fg = colors.peach },
		-- ["@tag.attribute"] = { fg = colors.green },
		-- ["@tag.delimiter"] = { fg = colors.green },
		-- Строки (белый цвет)
		-- String = { fg = "#ffffff" },
		-- Строки в TypeScript/TSX (белый цвет)
		-- ["@string.tsx"] = { fg = "#ffffff" },
		-- ["@string.typescript"] = { fg = "#ffffff" },
		-- Строки в TypeScript/TSX (белый цвет)

		-- ["@function.tsx"] = { fg = "red" },
		-- ["@variable.tsx"] = { fg = "orange" },
		-- ["@lsp.type.function.typescriptreact"] = { fg = "#bb92f7" },
		-- ["@lsp.mod.declaration.typescriptreact"] = { fg = "orange" },
		-- ["@variable.tsx"] = { fg = "orange" },
		-- ["@lsp.typemod.function.readonly.typescriptreact"] = { fg = "orange" },


		-- Файлы спецификаций (Cucumber/Gherkin)
		-- ["@gherkin.feature"] = { fg = colors.peach, bold = true },
		-- ["@gherkin.scenario"] = { fg = colors.peach, bold = true },
		-- ["@gherkin.step"] = { fg = colors.text },
		-- ["@gherkin.keyword"] = { fg = colors.peach, bold = true },
		-- ["@gherkin.text"] = { fg = colors.text },
		-- ["@gherkin.parameter"] = { fg = colors.sky },
		-- ["@gherkin.tag"] = { fg = colors.mauve },
		-- ["@keyword.gherkin"] = { fg = colors.peach, bold = true },
		-- ["@string.gherkin"] = { fg = colors.teal },
		-- ["@cucumber.step"] = { fg = colors.text },
		-- ["@cucumber.keyword"] = { fg = colors.peach, bold = true },
		-- gherkinFeature = { fg = colors.peach, bold = true },
		-- gherkinScenario = { fg = colors.peach, bold = true },
		-- gherkinKeyword = { fg = colors.peach, bold = true },
		-- gherkinStep = { fg = colors.text },
		-- gherkinText = { fg = colors.text },
		-- gherkinParameter = { fg = colors.sky },
		-- gherkinTags = { fg = colors.mauve },


		-- Markdown разметка (заголовки, ссылки, жирный шрифт и т.д.)
		-- ["@markup.heading"] = { fg = colors.peach, bold = true },
		-- ["@markup.list"] = { fg = colors.red },
		-- ["@markup.link"] = { fg = colors.blue },
		-- ["@markup.link.label"] = { fg = colors.blue },
		-- ["@markup.raw"] = { fg = colors.teal },
		-- ["@markup.italic"] = { italic = true },
		-- ["@markup.strong"] = { bold = true },

		-- Подсветка типов (например, ModalProps в TypeScript)
		-- ["@type"] = { fg = colors.yellow, bold = true },
		-- ["@type.builtin"] = { fg = colors.yellow, bold = true },
		-- Подсветка ключевых слов (переопределение ссылок на Statement)
		-- ["@keyword.tsx"] = { fg = colors.mauve },
		-- ["@keyword.typescript"] = { fg = colors.mauve },
		-- LSP семантические токены (типы данных от языкового сервера)
		-- ["@lsp.type.variable"] = { link = "@variable" },
		-- ["@lsp.type.property"] = { link = "@property" },
		-- ["@lsp.type.function"] = { link = "@function" },
		-- ["@lsp.type.parameter"] = { fg = colors.text },
		-- ["@lsp.type.type"] = { link = "@type" },
		-- ["@lsp.type.class"] = { link = "@type" },
		-- ["@lsp.type.enum"] = { link = "@type" },
		-- ["@lsp.type.interface"] = { link = "@type" },
		-- ["@lsp.type.struct"] = { link = "@type" },
		-- ["@lsp.type.member"] = { link = "@variable.member" },
		-- ["@lsp.type.type"] = { link = "@type" },
		-- ["@lsp.type.class"] = { link = "@type" },
		-- ["@lsp.type.enum"] = { link = "@type" },
		-- ["@lsp.type.enumMember"] = { link = "@variable.member" },
		-- ["@lsp.type.namespace"] = { link = "@namespace" },
		-- ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },

		-- Git и Diff (изменения, конфликты, удаления)
		-- DiffAdd = { bg = "#374a2f", fg = colors.none },
		-- DiffChange = { bg = "#2e3a4a", fg = colors.none },
		-- DiffDelete = { bg = "#4a2f2f", fg = colors.red },
		-- DiffText = { bg = "#3a5060", fg = colors.none },
		-- DiffTextAdd = { bg = "#2a5040", fg = colors.none }, 
		-- diffAdded = { fg = colors.green },
		-- diffRemoved = { fg = colors.red },
		-- diffChanged = { fg = colors.blue },
		-- VDiffActiveFile = { link = "Search" },

		-- Дополнительные группы подсветки (сниппеты, меню автодополнения и др.)
		-- SnippetTabstopActive = { bg = colors.surface1, underline = true },
		-- PmenuBorder = { fg = colors.surface2, bg = colors.mantle },
		-- PmenuShadow = { bg = colors.crust },
		-- OkMsg = { fg = colors.green },
		-- StderrMsg = { fg = colors.red },
		-- StdoutMsg = { fg = colors.text },
	}

	for group, opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, opts)
	end
end

vim.o.background = "dark"
apply_custom_highlights()
