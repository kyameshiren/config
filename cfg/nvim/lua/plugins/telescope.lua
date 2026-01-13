return {
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-fzf-native.nvim' },
        { 'sharkdp/fd' },
        { 'nvim-telescope/telescope.nvim', 
                dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-fzf-native.nvim', 'sharkdp/fd' },
        },
}
