-- see https://vi.stackexchange.com/questions/43681/simplest-setup-for-nvim-and-rust-and-system-rust-analyzer
return {
    {
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            config = function()
                require("nvim-treesitter.configs").setup {
                    ensure_installed = { "c", "lua", "rust" },
                    highlight = { enable = true, }
                }
            end
        },
    },
    { 'rust-lang/rust.vim' },
    {
        'mrcjkb/rustaceanvim',
        version = '^3',
        ft = { 'rust' },
    },
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
        opts = {}
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        "junegunn/fzf",
        dir = "~/.fzf",
        run = "./install -all",
    },
    { "junegunn/fzf.vim" },
    { 'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end
    },
    { 'williamboman/mason-lspconfig.nvim',
        config = function()
            require('mason-lspconfig').setup()
        end
    },
    { 'neovim/nvim-lspconfig',
        config = function()
            require('lspconfig')['clangd'].setup({})
        end
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", -- needed for autocomplete with LSP
            "hrsh7th/cmp-buffer", -- source for text in buffer
            "hrsh7th/cmp-path", -- source for file system paths
            {
                "L3MON4D3/LuaSnip",
                version = "v2.*",
                -- install jsregexp (optional!).
                build = "make install_jsregexp",
            },
            "rafamadriz/friendly-snippets",
            "onsails/lspkind.nvim", -- vs-code like pictograms
        },
        config = function()
            local cmp = require("cmp")
            local lspkind = require("lspkind")
            local luasnip = require("luasnip")

            -- enable LSP autocomplete
            local lspconfig = require('lspconfig')
            local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
            lspconfig.lua_ls.setup({
                capabilities = lsp_capabilities,
            })

            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.close(),
                    ["<CR>"] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp", keyword_length = 1 },
                    { name = "luasnip", keyword_length = 2 },
                    { name = "buffer", keyword_length = 3 },
                    { name = "path", keyword_length = 2 },
                }),
                formatting = {
                    fields = {'menu', 'abbr'},
                    format = function(entry, item)
                        local menu_icon = {
                            nvim_lsp = '💾',
                            luasnip = '🍴',
                            buffer = '📰',
                            path = '📁',
                        }

                        item.menu = menu_icon[entry.source.name]
                        return item
                    end,
                },
                window = {
                    documentation = cmp.config.window.bordered()
                },
            })
        end
    },
}
