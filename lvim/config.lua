-- vim options
vim.opt.relativenumber = true
vim.opt.textwidth = 80
vim.opt.wrapmargin = 2
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.formatoptions = "tcr/qj"
vim.opt.ignorecase = false

-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  pattern = "*",
  timeout = 1000,
}

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-M-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<C-M-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<C-M-k>"] = ":bp<CR>"
lvim.keys.normal_mode["<C-M-j>"] = ":bn<CR>"
lvim.keys.normal_mode[":"] = "q:i"
lvim.keys.visual_mode[":"] = "q:i"
lvim.keys.normal_mode["<C-;>"] = ":"
lvim.keys.visual_mode["<C-;>"] = ":"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- -- Change theme settings
-- lvim.colorscheme = "lunar"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- always installed on startup, useful for parsers without a strict filetype
-- `ls ~/.local/share/lvim/site/pack/lazy/opt/nvim-treesitter/parser/`
lvim.builtin.treesitter.ensure_installed = {
  "asm",
  "bash",
  "c",
  "comment",
  "cpp",
  "css",
  "c_sharp",
  "go",
  "html",
  "java",
  "javascript",
  "json",
  "lua",
  "markdown_inline",
  "python",
  "r",
  "regex",
  "ruby",
  "rust",
  "sql",
  "svelte",
  "tsx",
  "typescript",
  "vimdoc",
  "xml",
  "zig",
}

-- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>
--
-- `ls ~/.local/share/lvim/mason/packages/`

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "stylua" },
--   {
--     command = "prettier",
--     extra_args = { "--print-width", "100" },
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- change to diagnostics???
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- }

-- local code_actions = require "lvim.lsp.null-ls.code_actions"
-- code_actions.setup {
--   {
--     command = "eslint_d",
--     filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
--     args = { "-f", "json", "--stdin", "--stdin-filename", "$FILENAME" },
--   },
-- }

-- lvim.format_on_save.enabled = true

-- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
  -- {
  --   "folke/trouble.nvim",
  --   cmd = "TroubleToggle",
  -- },
  {
    "tpope/vim-surround",
  }
}

-- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
lvim.autocommands = {
  {
    "BufEnter",
    {
      pattern = {
        "*.asm",
        "*.c",
        "*.cpp",
        "*.cs",
        "*.csx",
        "*.go",
        "*.h",
        "*.hpp",
        "*.java",
        "*.ps1",
        "*.py",
        "*.r",
        "*.rs",
        "*.s",
        "*.sh",
        "*.zig",
      },
      callback = function()
        vim.opt.shiftwidth = 4
        vim.opt.tabstop = 4
      end
    }
  },
  {
    "BufEnter",
    {
      pattern = {
        "*.css",
        "*.hs",
        "*.html",
        "*.ipynb",
        "*.js",
        "*.json",
        "*.jsx",
        "*.lua",
        "*.nix",
        "*.rb",
        "*.svelte",
        "*.ts",
        "*.tsx",
        "*.xml",
      },
      callback = function()
        vim.opt.shiftwidth = 2
        vim.opt.tabstop = 2
      end
    }
  }
}
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
