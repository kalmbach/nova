-- set leader key to space (Spacebar)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- Window movement
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-l>", "<C-w>l")

-- Window splitting
keymap.set("n", "<C-v>", ":vs<CR>")
keymap.set("n", "<C-s>", ":split<CR>")

-- clear search hightlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search hightlights" })

-- Show next search result in the center of screen
keymap.set("n", "n", "nzz", { desc = "Show next search result" })
keymap.set("n", "N", "Nzz", { desc = "Show previous search result" })

-- Buffer movement
keymap.set("n", "<tab>", ":bn<CR>", { desc = "Go to next buffer" })
keymap.set("n", "<S-tab>", ":bp<CR>", { desc = "Go to previous buffer" })

-- Diagnostic keymaps
vim.keymap.set('n', ',d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', '.d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- SYNTAX --
-- Add support for coffeescript syntax highlight
vim.filetype.add({
  extension = {
    coffee = 'coffeescript'
  }
})

-- OPTIONS --

-- Reload files changed outside vim
vim.o.autoread = true

-- Automatically :write before running commands
vim.o.autowrite = true

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Sync clipboard between OS and Neovim.
-- Remove this option if you want your OS clipboard to remain independent.
-- See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Number of spaces that a <Tab> counts for
vim.o.tabstop = 2
vim.o.softtabstop = 0  -- replicate tabstop
vim.o.shiftwidth = 0   -- replicate tabstop
vim.o.expandtab = true -- only insert spaces

-- Dont Save undo history
vim.o.undofile = false

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Show matches when searching
vim.o.incsearch = true

-- Set highlight on search
vim.o.hlsearch = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal support this
vim.o.termguicolors = true

-- Open new horizontal split at bottom
-- Open new vertical split at right
vim.o.splitbelow = true
vim.o.splitright = true

-- Highlight on yank
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Install lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Load plugins
require("lazy").setup({
  -- lua functions that many plugins use
  "nvim-lua/plenary.nvim",

  -- tmux & split window navigation
  "christoomey/vim-tmux-navigator",

  "nvim-tree/nvim-web-devicons",
  "tpope/vim-fugitive",

  -- Autopairs {} () []
  { "windwp/nvim-autopairs",  opts = {} },

  -- Add/Delete/Change surrounding pairs
  { "kylechui/nvim-surround", version = "*", config = true },

  -- Useful plugin to show you pending keybinds
  { "folke/which-key.nvim",   opts = {} },

  -- "gc" to comment visual region/lines
  { "numToStr/Comment.nvim",  opts = {},     config = true },

  {
    "szw/vim-maximizer",
    keys = {
      { "<leader>sm", "<cmd>MaximizerToggle<CR>" }
    }
  },

  -- catppuccin colorscheme
  {
    "catppuccin/nvim",
    priority = 1000,
    name = "catppuccin",
    config = function()
      local catppuccin = require("catppuccin")

      catppuccin.setup({
        flavour = "mocha",
        integrations = {
          cmp = true,
          nvimtree = true
        }
      })

      -- load the colorscheme
      vim.o.termguicolors = true
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  -- completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",       -- source for text in buffer
      "hrsh7th/cmp-path",         -- source for file system paths
      "hrsh7th/cmp-nvim-lsp",     -- lsp completions
      "L3MON4D3/LuaSnip",         -- snippet engine
      "saadparwaiz1/cmp_luasnip", -- for autocompletion
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      luasnip.setup({
        keys = function()
          return {}
        end,
      })

      cmp.setup({
        completion = {
          completeopt = "menu,menuone,preview,noselect",
        },
        snippet = { -- configure how nvim-cmp interacts with snippet engine
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
          ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
          ["<C-e>"] = cmp.mapping.abort(),        -- close completion window
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        -- sources for autocompletion
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" }, -- text within current buffer
          { name = "path" },   -- file system paths
        }),
      })
    end
  },

  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local lualine = require("lualine")

      lualine.setup({
        options = {
          icons_enabled = false,
          component_separators = '|',
          section_separators = '',
          theme = "horizon"
        },
        sections = {
          lualine_b = { 'branch', 'diff' },
          lualine_z = {
            {
              'diagnostics',
              sources = { 'nvim_diagnostic', 'nvim_lsp' },
              sections = { 'error', 'warn', 'info', 'hint' },
              diagnostics_color = {
                error = 'DiagnosticError',
                warn  = 'DiagnosticWarn',
                info  = 'DiagnosticInfo',
                hint  = 'DiagnosticHint',
              },
              symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' },
              colored = true,
              update_in_insert = false,
              always_visible = false,
            }
          }
        }
      })
    end
  },

  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          results_title = false,
          sorting_strategy = "ascending",
          layout_strategy = "vertical",
          layout_config = {
            preview_cutoff = 1,
            prompt_position = 'top',
            width = function(_, max_columns, _)
              return math.min(max_columns, 100)
            end,
            height = function(_, _, max_lines)
              return math.min(max_lines, 30)
            end
          },
          border = true,
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous, -- move to the prev result
              ["<C-j>"] = actions.move_selection_next,     -- move to the next result
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            }
          }
        }
      })

      telescope.load_extension("fzf")

      keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
      keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
      keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
      keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
      keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
      keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
      keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
      keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
    end
  },

  -- language servers
  {
    "neovim/nvim-lspconfig",
    event = { "bufreadpre", "bufnewfile" },
    dependencies = {
      -- add lsp completion capabilities
      "hrsh7th/cmp-nvim-lsp",

      -- add completion for the nvim lua api
      "folke/neodev.nvim"
    },
    config = function()
      -- import lspconfig plugin
      local lspconfig = require("lspconfig")

      -- import cmp-nvim-lsp plugin
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      local on_attach = function(client, bufnr)
        -- avoid tsserver clash with denols
        if lspconfig.util.root_pattern("deno.json", "import_map.json")(vim.fn.getcwd()) then
          if client.name == "tsserver" then
            client.stop()
            return
          end
        end

        keymap.set("n", "gd", "<cmd>telescope lsp_definitions<cr>", { buffer = bufnr, desc = "goto definition" })
        keymap.set("n", "gr", "<cmd>telescope lsp_references<cr>", { buffer = bufnr, desc = "goto references" })
        keymap.set("n", "gi", "<cmd>telescope lsp_implementations<cr>", { buffer = bufnr, desc = "goto implementation" })
        keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "show documentation" })
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "smart rename" })
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "code actions" })

        vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
          vim.lsp.buf.format()
        end, { desc = "format current buffer with lsp" })
      end

      -- used to enable autocompletion (assign to every lsp server config)
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

      -- change the diagnostic symbols in the sign column (gutter)
      -- local signs = { Error = " ", Warn = " ", Hint = "* ", Info = " " }
      -- for type, icon in pairs(signs) do
      --  local hl = "DiagnosticSign" .. type
      --  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      -- end

      local servers = {
        "gopls",
        "rust_analyzer",
      }

      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })
      end

      -- lua_ls
      lspconfig["lua_ls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = { -- custom settings for lua
          Lua = {
            -- make the language server recognize "vim" global
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              -- make language server aware of runtime files
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      })

      -- setup neovim lua documentation
      require("neodev").setup()
    end,
  },
}, {
  install = {
    colorscheme = { "catppuccin" }
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
