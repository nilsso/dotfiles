local alpha = require('alpha')
local theme = require('alpha.themes.dashboard')
local headers = require('plugins.alpha-headers')

theme.section.header.val = headers[math.random(#headers)]

theme.section.buttons.val = {
    theme.button('e', '  New file', '<cmd>ene <CR>'),
    theme.button('r', '  Recents', '<cmd>lua require("telescope.builtin").oldfiles()<CR>'),
    theme.button('n', '  File tree', '<cmd>NvimTreeOpen<CR>'),
    theme.button('f', '  Find file', '<cmd>lua require("telescope.builtin").find_files()<CR>'),
    theme.button('t', '  Find text', '<cmd>lua require("telescope.builtin").live_grep{}<CR>'),
    -- dashboard.button('t', '  Find text',
    -- [[<cmd>lua require('telescope.builtin').live_grep{search_dirs={vim.fn.getcwd()}}<CR>]]
    -- ),
-- --     dashboard.button('SPC f h', '  Recently opened files'),
-- --     dashboard.button('SPC f r', '  Frecency/MRU'),
-- --     dashboard.button('f', '  Find word'),
-- --     dashboard.button('m', '  Jump to bookmarks'),
-- --     dashboard.button('s', '  Open last session'),
    theme.button('q', '  Quit', ':qa<CR>'),
}
alpha.setup(theme.config)
