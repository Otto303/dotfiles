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
            api.map.on_attach.default(bufnr)
            -- Override/Remove the default <C-t> behavior in the tree
            vim.keymap.set("n", "<C-t>", api.tree.toggle, opts("Toggle"))
        end

        require("nvim-tree").setup({
            view = {
                side = "right",
            },
            git = {
                enable = true,
                ignore = true,       -- Do not show files listed in gitignore
                show_on_dirs = true, -- Shows git status icons on parent directories
                timeout = 400,
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
                highlight_git = "name",
                highlight_diagnostics = "name",
                icons = {
                    glyphs = {
                        git = {
                            unstaged  = " ",
                            staged    = " ",
                            unmerged  = " ",
                            renamed   = "➜ ",
                            untracked = " ",
                            deleted   = "󰆴 ",
                            ignored   = " ",
                        },
                    },
                },
            },
            filters = {
                dotfiles = true,
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
