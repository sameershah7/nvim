return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim"},
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")
        local term = require("harpoon.term")

        vim.keymap.set("n", "<leader>a", function() mark.add_file() end)
        vim.keymap.set("n", "<C-m>", function() ui.toggle_quick_menu() end)

        -- Navigate to specific harpoon files
        vim.keymap.set("n", "<A-h>", function() ui.nav_file(1) end)
        vim.keymap.set("n", "<A-j>", function() ui.nav_file(2) end)
        vim.keymap.set("n", "<A-k>", function() ui.nav_file(3) end)
        vim.keymap.set("n", "<A-l>", function() ui.nav_file(4) end)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<C-p>", function() ui.nav_prev() end )
        vim.keymap.set("n", "<C-n>", function() ui.nav_next() end )

        vim.keymap.set("n", "<C-j>", function() term.gotoTerminal(1) end)
    end
}
