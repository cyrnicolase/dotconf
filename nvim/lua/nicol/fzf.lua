local status_ok, fzflua = pcall(require, "fzf-lua")
if not status_ok then
    return
end

fzflua.setup = {
    winopts = {
        hl = { border = "FloatBorder" }
    },
    files = {
        find_opts = [[-type f -not -path '*/\.git/*'\n']],
    }
}

