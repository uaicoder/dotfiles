-- Neovim configuration for the 'dired' plugin
vim.keymap.set("n", "<leader>pv", function()
  vim.cmd("Dired .")
end, { desc = "Open Dired in current dir" })

-- Set up the 'dired' plugin with custom options
require("dired").setup({
    path_separator = "/", 
    show_hidden = false,
    show_icons = false,
    show_banner = false,
    hide_details = false,
    sort_order = "name",

    keybinds = {
        dired_enter = "o",   -- Open selected file or directory
        dired_back = "O",    -- Go back to previous directory
        dired_up = "_",
        dired_rename = "R",
        dired_quit = "q",
        -- Add more as needed
    },

    colors = {
        DiredDimText = { link = {}, bg = "NONE", fg = "505050", gui = "NONE" },
        DiredDirectoryName = { link = {}, bg = "NONE", fg = "9370DB", gui = "NONE" },
        DiredMoveFile = { link = {}, bg = "NONE", fg = "ff3399", gui = "bold" },
    },
})

