local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
    vim.notify("nvim-treesitter" .. " not installed!")
    return
end

configs.setup {
    ensure_installed = {"lua", "go", "php", "python", "vim"},
    highlight = {enable = true, additional_vim_regex_highlight = true},
    indent = {enable = true},
    autopairs = {enable = true},
}
