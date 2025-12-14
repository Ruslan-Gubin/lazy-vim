return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
      popup_border_style = "NC", -- or "" to use 'winborder' on Neovim v0.11+
      enable_git_status = true,
      enable_diagnostics = true,


    sources = {
      "filesystem",
      "buffers",
      -- "git_status",
      "document_symbols",
    },
      
      event_handlers = {
        {
          event = "file_open_requested",
          handler = function()
            require("neo-tree.command").execute({ action = "close" })
          end
        },
      },

window = {
    position = "left",
    width = 100,
    mapping_options = {
      noremap = true,
      nowait = true,
    },
    mappings = {
      ["<space>"] = {
        "toggle_node",
        nowait = true, 
      },
      ["o"] = "open",
      ["<2-LeftMouse>"] = "open",
      ["<cr>"] = nil,
      ["<esc>"] = "cancel", -- close preview or floating neo-tree window
      ["P"] = {
        "toggle_preview",
        config = {
          use_float = true,
          -- use_snacks_image = true,
          -- use_image_nvim = true,
        },
      },
      -- Read `# Preview Mode` for more information
      ["l"] = "focus_preview",
      ["S"] = "open_split",
      ["s"] = "open_vsplit",
      -- ["S"] = "split_with_window_picker",
      -- ["s"] = "vsplit_with_window_picker",
      ["t"] = "open_tabnew",
      -- ["<cr>"] = "open_drop",
      -- ["t"] = "open_tab_drop",
      ["w"] = "open_with_window_picker",
      --["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
      ["C"] = "close_node",
      -- ['C'] = 'close_all_subnodes',
      ["z"] = "close_all_nodes",
      --["Z"] = "expand_all_nodes",
      --["Z"] = "expand_all_subnodes",
      ["a"] = {
        "add",
        -- some commands may take optional config options, see `:h neo-tree-mappings` for details
        config = {
          show_path = "none", -- "none", "relative", "absolute"
        },
      },
      ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
      ["d"] = "delete",
      ["r"] = "rename",
      ["b"] = "rename_basename",
      ["y"] = "copy_to_clipboard",
      ["x"] = "cut_to_clipboard",
      ["p"] = "paste_from_clipboard",
      ["<C-r>"] = "clear_clipboard",
      ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
      ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
      ["q"] = "close_window",
      ["R"] = "refresh",
      ["?"] = "show_help",
      ["<"] = "prev_source",
      [">"] = "next_source",
      ["i"] = "show_file_details",
    },
  },

  nesting_rules = {},

  filesystem = {
    filtered_items = {
      visible = false, -- when true, they will just be displayed differently than normal items
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_ignored = false, -- hide files that are ignored by other gitignore-like files
      ignore_files = {
        ".neotreeignore",
        ".ignore",
      },
      hide_hidden = true, -- only works on Windows for hidden files/directories
      hide_by_name = {
      },
      hide_by_pattern = { -- uses glob style patterns
      },
      always_show = { -- remains visible even if other settings would normally hide it
      },
      always_show_by_pattern = { -- uses glob style patterns
      },
      never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
      },
      never_show_by_pattern = { -- uses glob style patterns
      },
    },

follow_current_file = {
      enabled = true, -- This will find and focus the file in the active buffer every time
      --               -- the current file is changed while the tree is open.
      leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
    },
    group_empty_dirs = false, -- when true, empty folders will be grouped together
    hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
    use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
    window = {
      mappings = {
        ["<o>"] = { "navigate_up", nowait = true },
        -- ["<o>"] = "navigate_up",
        ["."] = "set_root",
        ["H"] = "toggle_hidden",
        ["/"] = "fuzzy_finder",
        ["D"] = "fuzzy_finder_directory",
        ["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
        ["f"] = "filter_on_submit",
        ["<c-x>"] = "clear_filter",
        ["[g"] = "prev_git_modified",
        ["]g"] = "next_git_modified",
        ["oc"] = { "order_by_created", nowait = true },
        ["od"] = { "order_by_diagnostics", nowait = true },
        ["og"] = { "order_by_git_status", nowait = true },
        ["om"] = { "order_by_modified", nowait = true },
        ["on"] = { "order_by_name", nowait = true },
        ["os"] = { "order_by_size", nowait = true },
        ["ot"] = { "order_by_type", nowait = true },
        -- ['<key>'] = function(state) ... end,
      },

      fuzzy_finder_mappings = { 
        ["<down>"] = "move_cursor_down",
        ["<C-n>"] = "move_cursor_down",
        ["<up>"] = "move_cursor_up",
        ["<C-p>"] = "move_cursor_up",
        ["<esc>"] = "close",
        ["<S-CR>"] = "close_keep_filter",
        ["<C-CR>"] = "close_clear_filter",
        ["<C-w>"] = { "<C-S-w>", raw = true },
        {
          -- normal mode mappings
          n = {
            ["j"] = "move_cursor_down",
            ["k"] = "move_cursor_up",
            ["<S-CR>"] = "close_keep_filter",
            ["<C-CR>"] = "close_clear_filter",
            ["<esc>"] = "close",
          }
        }
        -- ["<esc>"] = "noop", -- if you want to use normal mode
        -- ["key"] = function(state, scroll_padding) ... end,
      },
    },
      commands = {}, -- Add a custom command or override a global one using the same function name
  },
buffers = {
    follow_current_file = {
      enabled = true, -- This will find and focus the file in the active buffer every time
      --              -- the current file is changed while the tree is open.
      leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
    },
    group_empty_dirs = true, -- when true, empty folders will be grouped together
    show_unloaded = true,
    window = {
      mappings = {
        ["d"] = "buffer_delete",
        ["bd"] = "buffer_delete",
        ["<o>"] = { "navigate_up", nowait = true },
        ["."] = "set_root",
        -- ["o"] = {
        --   "show_help",
        --   nowait = false,
        --   config = { title = "Order by", prefix_key = "o" },
        -- },
        ["oc"] = { "order_by_created", nowait = true },
        ["od"] = { "order_by_diagnostics", nowait = true },
        ["om"] = { "order_by_modified", nowait = true },
        ["on"] = { "order_by_name", nowait = true },
        ["os"] = { "order_by_size", nowait = true },
        ["ot"] = { "order_by_type", nowait = true },
      },
    },
  },
  -- git_status = {
  --   window = {
  --     position = "float",
  --     mappings = {
  --       ["A"] = "git_add_all",
  --       ["gu"] = "git_unstage_file",
  --       ["gU"] = "git_undo_last_commit",
  --       ["ga"] = "git_add_file",
  --       ["gt"] = "git_toggle_file_stage",
  --       ["gr"] = "git_revert_file",
  --       ["gc"] = "git_commit",
  --       ["gp"] = "git_push",
  --       ["gg"] = "git_commit_and_push",
  --       -- ["o"] = {
  --       --   "show_help",
  --       --   nowait = false,
  --       --   config = { title = "Order by", prefix_key = "o" },
  --       -- },
  --       ["oc"] = { "order_by_created", nowait = true },
  --       ["od"] = { "order_by_diagnostics", nowait = true },
  --       ["om"] = { "order_by_modified", nowait = true },
  --       ["on"] = { "order_by_name", nowait = true },
  --       ["os"] = { "order_by_size", nowait = true },
  --       ["ot"] = { "order_by_type", nowait = true },
  --     },
  --   },
  -- },

    })
  end,
}
