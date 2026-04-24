return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        -- Define the on_attach function to handle buffer-local mappings
        local function my_on_attach(bufnr)
            local api = require("nvim-tree.api")
            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end
            -- Apply default mappings
            api.config.mappings.default_on_attach(bufnr)
            -- Override/Remove the default <C-t> behavior in the tree
            vim.keymap.set("n", "<C-t>", api.tree.toggle, opts("Toggle"))
        end

        require("nvim-tree").setup({
            view = {
                side = "right",
            },
            diagnostics = {
                enable = true,
                show_on_dirs = true,
                icons = {
                    hint = "󰌵",
                    info = "",
                    warning = "",
                    error = "",
                },
            },
            renderer = {
                highlight_diagnostics = "name",
            },
            on_attach = my_on_attach,
        })

        vim.keymap.set(
            "n",
            "<C-t>",
            "<cmd>NvimTreeToggle<CR>",
            { desc = "Open/close file tree" }
        )
    end,
}
