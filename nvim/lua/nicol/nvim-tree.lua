-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
    return
end

local icon_status_ok, nvim_web_devicons = pcall(require, "nvim-web-devicons")
if not icon_status_ok then
    return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
nvim_tree.setup {
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
                { key = "p", action = "parent_node" },
                { key = "m", action = "rename" },
                { key = "t", action = "tabnew" },
                { key = "s", action = "vsplit" },
                { key = "v", action = "split" },
                { key = "i", action = "split" },
            },
        },
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
    git = {
        enable = false,
    }
}

