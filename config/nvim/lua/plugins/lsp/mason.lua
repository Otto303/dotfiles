return {
    "mason-org/mason.nvim",
    dependencies = {
        "mason-org/mason-lspconfig.nvim",
    },
    config = function()
        -- import mason
        local mason = require("mason")

        -- import mason-lspconfig
        local mason_lspconfig = require("mason-lspconfig")

        -- Activate mason and customize icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        mason_lspconfig.setup({
            automatic_enable = true,
            -- Liste of servers to install by default
            -- List of possible servers: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
            -- You can omit this entry and install everything using :Mason
            -- But instead of using :Mason to install, I recommend adding an entry to this list
            -- This will make your configuration more portable
            ensure_installed = {
                "clangd",
                "pylsp",
                "lua_ls",
            },
        })
    end,
}
