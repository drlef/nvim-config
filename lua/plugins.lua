-- see https://vi.stackexchange.com/questions/43681/simplest-setup-for-nvim-and-rust-and-system-rust-analyzer
return {
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
}
}
