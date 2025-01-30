return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
        term_colors = true,
        transparent_background = true,
        dim_inactive = {
            enabled = false,
            shade = "dark",
            percentage = 1,
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
            vim.cmd.colorscheme("catppuccin")
        end,
    },
}
