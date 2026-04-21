return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim"},
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")
        local term = require("harpoon.term")

        vim.keymap.set("n", "<leader>a", function() mark.add_file() end)
        vim.keymap.set("n", "<leader>m", function() ui.toggle_quick_menu() end)

        -- Navigate to specific harpoon files
        vim.keymap.set("n", "<A-h>", function() ui.nav_file(1) end)
        vim.keymap.set("n", "<A-j>", function() ui.nav_file(2) end)
        vim.keymap.set("n", "<A-k>", function() ui.nav_file(3) end)
        vim.keymap.set("n", "<A-l>", function() ui.nav_file(4) end)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<C-p>", function() ui.nav_prev() end )
        vim.keymap.set("n", "<C-n>", function() ui.nav_next() end )


        local term_buf = nil
        local term_win = nil

        vim.keymap.set("n", "<leader>t", function()
            if term_win and vim.api.nvim_win_is_valid(term_win) then
                vim.api.nvim_win_hide(term_win)
                term_win = nil
            else
                vim.cmd("botright split")
                vim.cmd("resize 12")
                term_win = vim.api.nvim_get_current_win()

                if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
                    vim.api.nvim_win_set_buf(term_win, term_buf)
                else
                    vim.cmd("terminal")
                    term_buf = vim.api.nvim_get_current_buf()

                    -- terminal-only mappings:
                    -- Press 'a' in Normal mode to enter Terminal mode
                    vim.keymap.set("n", "a", "i", { buffer = term_buf, remap = true })

                    -- Press 'n' in Terminal mode to return to Normal mode
                    vim.keymap.set("t", "n", [[<C-\><C-n>]], { buffer = term_buf })
                end
                vim.cmd("stopinsert")
            end
        end)

    end
}
