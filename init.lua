vim.opt.termguicolors = true

-- ============================================================================
-- OPTIONS
-- ============================================================================
vim.opt.number = true -- line number
vim.opt.relativenumber = true -- relative line numbers
vim.opt.cursorline = true -- highlight current line
vim.opt.wrap = false -- do not wrap lines by default
vim.opt.scrolloff = 10 -- keep 10 lines above/below cursor
vim.opt.sidescrolloff = 10 -- keep 10 lines to left/right of cursor

vim.opt.tabstop = 2 -- tabwidth
vim.opt.shiftwidth = 2 -- indent width
vim.opt.softtabstop = 2 -- soft tab stop not tabs on tab/backspace
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.smartindent = true -- smart auto-indent
vim.opt.autoindent = true -- copy indent from current line

vim.opt.ignorecase = true -- case insensitive search
vim.opt.smartcase = true -- case sensitive if uppercase in string
vim.opt.hlsearch = true -- highlight search matches
vim.opt.incsearch = true -- show matches as you type

vim.opt.signcolumn = "yes" -- always show a sign column
vim.opt.colorcolumn = "100" -- show a column at 100 position chars
vim.opt.showmatch = true -- highlights matching brackets
vim.opt.cmdheight = 1 -- single line command line
vim.opt.completeopt = "menuone,noinsert,noselect" -- completion options
vim.opt.showmode = false -- do not show the mode, instead have it in statusline
vim.opt.pumheight = 10 -- popup menu height
vim.opt.pumblend = 10 -- popup menu transparency
vim.opt.winblend = 0 -- floating window transparency
vim.opt.conceallevel = 2 -- obsidian requirement
vim.opt.concealcursor = "" -- do not hide cursorline in markup
vim.opt.synmaxcol = 300 -- syntax highlighting limit
vim.opt.fillchars = { eob = " " } -- hide "~" on empty lines

local undodir = vim.fn.expand("~/.vim/undodir")
if
	vim.fn.isdirectory(undodir) == 0 -- create undodir if nonexistent
then
	vim.fn.mkdir(undodir, "p")
end

vim.opt.backup = false -- do not create a backup file
vim.opt.writebackup = false -- do not write to a backup file
vim.opt.swapfile = false -- do not create a swapfile
vim.opt.undofile = true -- do create an undo file
vim.opt.undodir = undodir -- set the undo directory
vim.opt.updatetime = 300 -- faster completion
vim.opt.timeoutlen = 500 -- timeout duration
vim.opt.ttimeoutlen = 50 -- key code timeout
vim.opt.autoread = true -- auto-reload changes if outside of neovim
vim.opt.autowrite = false -- do not auto-save

vim.opt.hidden = true -- allow hidden buffers
vim.opt.errorbells = false -- no error sounds
vim.opt.backspace = "indent,eol,start" -- better backspace behaviour
vim.opt.autochdir = false -- do not autochange directories
vim.opt.iskeyword:append("-") -- include - in words
vim.opt.path:append("**") -- include subdirs in search
vim.opt.selection = "inclusive" -- include last char in selection
vim.opt.mouse = "a" -- enable mouse support
vim.opt.clipboard:append("unnamedplus") -- use system clipboard
vim.opt.modifiable = true -- allow buffer modifications

vim.opt.guicursor =
	"n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175" -- cursor blinking and settings

-- Folding: requires treesitter available at runtime; safe fallback if not
vim.opt.foldmethod = "expr" -- use expression for folding
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- use treesitter for folding
vim.opt.foldlevel = 99 -- start with all folds open

vim.opt.splitbelow = true -- horizontal splits go below
vim.opt.splitright = true -- vertical splits go right

vim.opt.wildmenu = true -- tab completion
vim.opt.wildmode = "longest:full,full" -- complete longest common match, full completion list, cycle through with Tab
vim.opt.diffopt:append("linematch:60") -- improve diff display
vim.opt.redrawtime = 10000 -- increase neovim redraw tolerance
vim.opt.maxmempattern = 20000 -- increase max memory
-- ============================================================================
-- KEYMAPS
-- ============================================================================
vim.g.mapleader = " " -- space for leader
vim.g.maplocalleader = " " -- space for localleader

-- better movement in wrapped text
vim.keymap.set("n", "j", function()
	return vim.v.count == 0 and "gj" or "j"
end, { expr = true, silent = true, desc = "Down (wrap-aware)" })
vim.keymap.set("n", "k", function()
	return vim.v.count == 0 and "gk" or "k"
end, { expr = true, silent = true, desc = "Up (wrap-aware)" })

vim.keymap.set("n", "<leader>c", ":nohlsearch<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<CR>", { desc = "Lazy git (POPPIN)" })

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })
vim.keymap.set({ "n", "v" }, "<leader>x", '"_d', { desc = "Delete without yanking" })

vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })

vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- ============================================================================
-- AUTOCMDS
-- ============================================================================

vim.pack.add({
	"https://www.github.com/ibhagwan/fzf-lua",
	"https://www.github.com/nvim-tree/nvim-tree.lua",
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
	},
	"https://github.com/obsidian-nvim/obsidian.nvim",
	"https://github.com/sainnhe/gruvbox-material",
	"https://github.com/kdheepak/lazygit.nvim",
	{
		src = "https://github.com/iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
	},
	"https://github.com/lervag/vimtex",
  "https://github.com/Saghen/blink.cmp",
  "https://github.com/L3MON4D3/LuaSnip",
  "https://github.com/rafamadriz/friendly-snippets",
  "https://github.com/lewis6991/gitsigns.nvim"
})

vim.g.gruvbox_material_background = "medium"
vim.g.gruvbox_material_better_performance = 1

vim.cmd.colorscheme("gruvbox-material")

-- ============================================================================
-- PLUGIN CONFIGS
-- ============================================================================

require('gitsigns').setup({
  signs = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']h', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')

    end, { desc = "Next git hunk" })

    map('n', '[h', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end, { desc = "Previous git hunk" })

    -- Actions
    map('n', '<leader>hs', gitsigns.stage_hunk, { desc = "Stage hunk" })
    map('n', '<leader>hr', gitsigns.reset_hunk, { desc = "Reset hunk" })
    map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = "Undo stage hunk" })
    map('n', '<leader>hp', gitsigns.preview_hunk, { desc = "Preview hunk" })
    map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end, { desc = "Blame line" })
    map('n', '<leader>hd', gitsigns.diffthis, { desc = "Diff against index" })
    map('n', '<leader>hD', function() gitsigns.diffthis('~') end, { desc = "Diff against last commit" })

  end
})

local setup_treesitter = function()
	local treesitter = require("nvim-treesitter")
	treesitter.setup({})
	local ensure_installed = {
		"vim",
		"vimdoc",
		"rust",
		"c",
		"cpp",
		"go",
		"html",
		"css",
		"javascript",
		"json",
		"lua",
		"markdown",
		"python",
		"typescript",
		"vue",
		"svelte",
		"bash",
	}

	local config = require("nvim-treesitter.config")

	local already_installed = config.get_installed()
	local parsers_to_install = {}

	for _, parser in ipairs(ensure_installed) do
		if not vim.tbl_contains(already_installed, parser) then
			table.insert(parsers_to_install, parser)
		end
	end

	if #parsers_to_install > 0 then
		treesitter.install(parsers_to_install)
	end

	local group = vim.api.nvim_create_augroup("TreeSitterConfig", { clear = true })
	vim.api.nvim_create_autocmd("FileType", {
		group = group,
		callback = function(args)
			if vim.list_contains(config.get_installed(), vim.treesitter.language.get_lang(args.match)) then
				vim.treesitter.start(args.buf)
			end
		end,
	})
end

setup_treesitter()

local function get_notes_path()
	return vim.fn.expand("~/core")
end

local function setup_obsidian()
	require("obsidian").setup({
		legacy_commands = false,
		workspaces = { { name = "Notes", path = get_notes_path() } },
		picker = { name = "fzf-lua" },
	})

	vim.keymap.set("n", "<leader>nn", function()
		vim.cmd("Obsidian workspace")
		vim.defer_fn(function()
			vim.cmd("Obsidian new")
		end, 500)
	end, { desc = "New note" })
	vim.keymap.set("n", "<leader>nf", "<cmd>Obsidian quick_switch<cr>", { desc = "Find note" })
	vim.keymap.set("n", "<leader>ns", "<cmd>Obsidian search<cr>", { desc = "Search notes" })
	vim.keymap.set("n", "<leader>nt", "<cmd>Obsidian today<cr>", { desc = "Today's daily note" })
	vim.keymap.set("n", "<leader>nw", "<cmd>Obsidian workspace<cr>", { desc = "Switch workspace" })
end

setup_obsidian()

-- Markdown Preview
vim.keymap.set("n", "<leader>lv", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Toggle Markdown Preview" })

require("nvim-tree").setup({
	view = {
		width = 35,
	},
	filters = {
		dotfiles = false,
	},
	renderer = {
		group_empty = true,
	},
})
vim.keymap.set("n", "<leader>e", function()
	require("nvim-tree.api").tree.toggle()
end, { desc = "Toggle NvimTree" })

vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "NvimTreeSignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { fg = "#2a2a2a", bg = "none" })
vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "none" })

require("fzf-lua").setup({})

vim.keymap.set("n", "<leader>ff", function()
	require("fzf-lua").files({ cwd = "~/core/" })
end, { desc = "FZF Files" })
vim.keymap.set("n", "<leader>fg", function()
	require("fzf-lua").live_grep({ cwd = "~/core/" })
end, { desc = "FZF Live Grep" })
vim.keymap.set("n", "<leader>fb", function()
	require("fzf-lua").buffers()
end, { desc = "FZF Buffers" })
vim.keymap.set("n", "<leader>fh", function()
	require("fzf-lua").help_tags()
end, { desc = "FZF Help Tags" })
vim.keymap.set("n", "<leader>fx", function()
	require("fzf-lua").diagnostics_document()
end, { desc = "FZF Diagnostics Document" })
vim.keymap.set("n", "<leader>fX", function()
	require("fzf-lua").diagnostics_workspace()
end, { desc = "FZF Diagnostics Workspace" })

-- ============================================================================
-- LSP 
-- ============================================================================
require("luasnip.loaders.from_vscode").lazy_load()

-- 2. Configure Blink
require("blink.cmp").setup({
  keymap = { 
    preset = 'default',
    
    -- Navigate DOWN the completion list
    ['<C-j>'] = { 'select_next', 'fallback' },
    -- Navigate UP the completion list
    ['<C-k>'] = { 'select_prev', 'fallback' },
    
    -- Trigger completion and toggle the documentation window
    ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
    -- Accept the highlighted completion
    ['<CR>'] = { 'accept', 'fallback' },
  },
  
  completion = {
    ghost_text = { enabled = true },

    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200, -- Small delay so it doesn't flash too fast
    },
  },

  -- Tell Blink to use LuaSnip as its snippet engine
  snippets = {
    preset = 'luasnip',
  },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
  
  signature = { enabled = true } 
})

local capabilities = require("blink.cmp").get_lsp_capabilities()

-- Pro-tip from the Astral team (specifically for Linux users):
-- Enable dynamic registration so `ty` correctly watches newly created files
capabilities.workspace = capabilities.workspace or {}
capabilities.workspace.didChangeWatchedFiles = capabilities.workspace.didChangeWatchedFiles or {}
capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true


vim.lsp.config('ty', {
  cmd = { "ty", "server" },
  capabilities = capabilities,
  settings = {
    ty = {
      diagnosticMode = "workspace",
    }
  }
})


vim.lsp.config('ruff', {
  cmd = { "ruff", "server" },
  capabilities = capabilities,
  on_attach = function(client, bufnr)

    client.server_capabilities.hoverProvider = false
  end,
})


vim.lsp.enable('ty')
vim.lsp.enable('ruff')

-- ============================================================================
-- AUTO-FORMAT ON SAVE
-- ============================================================================
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp_attach_format", { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    
    if client and client.name == "ruff" then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.code_action({
            context = { only = { "source.organizeImports" } },
            apply = true,
          })
          vim.lsp.buf.format({ async = false, id = client.id })
        end,
      })
    end
  end,
})

-- ============================================================================
-- LSP KEYMAPS (Space Leader)
-- ============================================================================
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp_attach_keymaps", { clear = true }),
  callback = function(args)
    local opts = { buffer = args.buf, silent = true }

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to Definition" }))
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Go to Declaration" }))
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "Go to References" }))
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "Go to Implementation" }))
    
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover Documentation" }))

    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename Symbol" }))
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code Action" }))
    
    vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, vim.tbl_extend("force", opts, { desc = "Line Diagnostics" }))
  end,
})
