vim.g.mapleader = ' '
vim.opt.clipboard = 'unnamedplus'

vim.keymap.set('i', 'jk', '<ESC>')

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
vim.keymap.set('n', 'N', 'Nzz')

vim.keymap.set({'n', 'v'}, 'H', '^')
vim.keymap.set({'n', 'v'}, 'L', '$')

vim.keymap.set('n', '<leader><', '<cmd>vertical resize 35<cr>')
vim.keymap.set('n', '<leader>>', '<cmd>vertical resize 100<cr>')
vim.keymap.set('n', '<leader>m', '<cmd>vsplit<cr>')
vim.keymap.set('n', '<leader>j', '<C-w>w')
vim.keymap.set('n', '<leader>p', '<C-w>z')

vim.keymap.set('n', '<leader>h', '<cmd>nohlsearch<cr>')

-- Oil
vim.keymap.set('n', '1', '<cmd>Oil<cr>')

-- Telescope
vim.keymap.set('n', '4', '<cmd>Telescope find_files hidden=true no_ignore=true<cr>')
require("telescope").setup({
        defaults = {
                vimgrep_arguments = {
                        "rg",
                        '--no-heading',
                        '--with-filename',
                        '--line-number',
                        '--column',
                        '--smart-case',
                        "--hidden",
                        "--no-ignore",
                },
        },
})
vim.keymap.set('n', '5', '<cmd>Telescope live_grep<cr>')

-- Terminal
vim.keymap.set('n', '<C-0>', '<cmd>terminal<cr>')
vim.keymap.set('t', '<C-9>', '<C-\\><C-n>')
