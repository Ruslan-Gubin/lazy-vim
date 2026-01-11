---@brief
---
--- https://github.com/yioneko/vtsls
---
--- `vtsls` can be installed with npm:
--- ```sh
--- npm install -g @vtsls/language-server
--- ```
---
--- To configure a TypeScript project, add a
--- [`tsconfig.json`](https://www.typescriptlang.org/docs/handbook/tsconfig-json.html)
--- or [`jsconfig.json`](https://code.visualstudio.com/docs/languages/jsconfig) to
--- the root of your project.
---
--- ### Vue support
---
--- Since v3.0.0, the Vue language server requires `vtsls` to support TypeScript.
---
--- - `location` MUST be defined. If the plugin is installed in `node_modules`, `location` can have any value.
--- - `languages` must include vue even if it is listed in filetypes.
--- - `filetypes` is extended here to include Vue SFC.
---
--- You must make sure the Vue language server is setup. For example,
---
--- ```
--- vim.lsp.enable('vue_ls')
--- ```
---
--- See `vue_ls` section and https://github.com/vuejs/language-tools/wiki/Neovim for more information.
---
--- ### Monorepo support
---
--- `vtsls` supports monorepos by default. It will automatically find the `tsconfig.json` or `jsconfig.json` corresponding to the package you are working on.
--- This works without the need of spawning multiple instances of `vtsls`, saving memory.
---
--- It is recommended to use the same version of TypeScript in all packages, and therefore have it available in your workspace root. The location of the TypeScript binary will be determined automatically, but only once.

---@type vim.lsp.Config
return {
  cmd = { 'vtsls', '--stdio' },
  init_options = {
    hostInfo = 'neovim',
  },
  filetypes = {
    'vue'
  },
  root_dir = function(bufnr, on_dir)
    -- The project root is where the LSP can be started from
    -- As stated in the documentation above, this LSP supports monorepos and simple projects.
    -- We select then from the project root, which is identified by the presence of a package
    -- manager lock file.
    local root_markers = { 'package-lock.json', 'yarn.lock', 'pnpm-lock.yaml', 'bun.lockb', 'bun.lock' }
    -- Give the root markers equal priority by wrapping them in a table
    root_markers = vim.fn.has('nvim-0.11.5') == 1 and { root_markers, { '.git' } }
      or vim.list_extend(root_markers, { '.git' })

    -- exclude deno
    if vim.fs.root(bufnr, { 'deno.json', 'deno.jsonc', 'deno.lock' }) then
      return
    end

    -- We fallback to the current working directory if no project root is found
    local project_root = vim.fs.root(bufnr, root_markers) or vim.fn.getcwd()

    on_dir(project_root)
  end,
}
