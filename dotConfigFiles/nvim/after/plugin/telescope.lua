local builtin = require('telescope.builtin')

-- Finds in files under current file tree
vim.keymap.set('n', '<leader>sf', builtin.find_files, {})

-- Finds in git files if in a git directory
--  Will probably want to update this to be as script later so that way it doesnt error when not in a git dir.
vim.keymap.set('n', '<leader>sg', builtin.git_files, {})

-- Finds the search text in the current tree directory files
vim.keymap.set('n', '<leader>sp', builtin.live_grep, {} )
