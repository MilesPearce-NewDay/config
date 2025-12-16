-- ============================================================
--  PACKER INITIALIZATION
-- ============================================================

-- Auto-install packer if not installed
local ensure_packer = function()
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
    end
    return false
    end

    local packer_bootstrap = ensure_packer()

    -- Automatically run :PackerCompile whenever this file is saved
    vim.cmd([[
        augroup packer_user_config
        autocmd!
        autocmd BufWritePost init.lua source <afile> | PackerCompile
        augroup end
    ]])

    -- ============================================================
    --  GENERAL OPTIONS
    -- ============================================================
    vim.g.mapleader = " "
    vim.o.termguicolors = true
    vim.o.number = true
    vim.o.relativenumber = true
    vim.opt.expandtab = true
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.softtabstop = 4
    vim.opt.wrap = false

    -- ============================================================
    --  PACKER: PLUGINS
    -- ============================================================
    require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    -- Kanagawa colorscheme
    use "rebelot/kanagawa.nvim"

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }

    -- nvim-tree (file explorer)
    use {
        'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function()
        require("nvim-tree").setup({
            sort_by = "case_sensitive",
            view = { width = 30 },
            renderer = { group_empty = true },
            filters = { dotfiles = false },
        })
        end
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} },
        config = function()
        local ok, telescope = pcall(require, "telescope")
        if not ok then return end

            local actions = require("telescope.actions")

            -- Custom function to send selected items to quickfix and open
            local function send_to_qflist_and_open(prompt_bufnr)
            actions.send_to_qflist(prompt_bufnr)
            vim.cmd("copen")
            end

            telescope.setup{
                defaults = {
                    prompt_prefix = "🔍 ",
                    selection_caret = "➤ ",
                    path_display = {"smart"},
                    mappings = {
                        i = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-q>"] = send_to_qflist_and_open,
                        },
                        n = {
                            ["<C-q>"] = send_to_qflist_and_open,
                        },
                    },
                }
            }

            -- Load FZF extension if installed
            pcall(telescope.load_extension, 'fzf')
            end
    }

    -- Telescope FZF Native (faster sorting)
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

    if packer_bootstrap then
        require("packer").sync()
        end
        end)

    -- ============================================================
    --  TELESCOPES KEYBINDINGS
    -- ============================================================
    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap('n', '<Leader>ff', '<cmd>Telescope find_files<cr>', opts)
    vim.api.nvim_set_keymap('n', '<Leader>fg', '<cmd>Telescope live_grep<cr>', opts)
    vim.api.nvim_set_keymap('n', '<Leader>fb', '<cmd>Telescope buffers<cr>', opts)
    vim.api.nvim_set_keymap('n', '<Leader>fh', '<cmd>Telescope help_tags<cr>', opts)

    -- Nvim-tree keybindings
    vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<Leader>o', ':NvimTreeFocus<CR>', { noremap = true, silent = true })

    -- ============================================================
    --  KANAGAWA CONFIG
    -- ============================================================
    require("kanagawa").setup({
        theme = "wave",
        commentStyle = { italic = true },
        keywordStyle = { italic = true },
    })
    vim.cmd("colorscheme kanagawa")

    -- ============================================================
    --  TREESITTER CONFIG
    -- ============================================================
    require("nvim-treesitter.configs").setup({
        ensure_installed = {
            "lua", "vim", "vimdoc",
            "python", "javascript", "html", "css", "json",
        },
        highlight = { enable = true },
        indent = { enable = true },
    })
