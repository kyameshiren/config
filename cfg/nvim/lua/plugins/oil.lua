return {
        { 'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {
                delete_to_trash = true,
                watch_for_changes = true,
                keymaps = {
                        ['-'] = false,
                        ['('] = { 'actions.parent', mode = 'n' },
                        ['2'] = { 'actions.preview', opts = { vertical = true, split = 'belowright' } },
                        ['3'] = { 'actions.preview', opts = { horizontal = true, split = 'belowright' } },
                },
                view_options = {
                        show_hidden = true,
                },
        },
        dependencies = { { 'nvim-mini/mini.icons', opts = {} } },
        lazy = false,
        }
}
