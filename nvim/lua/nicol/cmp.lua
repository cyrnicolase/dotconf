local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local lspkind_status_ok, lspkind = pcall(require, "lspkind")
if not lspkind_status_ok then
  return
end

cmp.setup({
    -- 设置代码片段引擎，用于根据代码片段补全
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },

    window = {
        documentation = cmp.config.window.bordered(),
    },

    -- 快捷键映射
    mapping = {
       ["<C-k>"] = cmp.mapping.select_prev_item(),                              -- 选择上一个 以前是 <C-p>
   	   ["<C-j>"] = cmp.mapping.select_next_item(),                              -- 选择下一个 以前是 <C-n>
       ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),      -- 向上翻页
       ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),       -- 向下翻页
       ["<C-n>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),           -- 出现补全
       ['<CR>'] = cmp.mapping.confirm({select = true,behavior = cmp.ConfirmBehavior.Replace}), -- 确认使用某个补全项
    },

    -- 补全来源
    sources = {
        {name = 'nvim_lsp'},
        {name = 'vsnip'},
        {name = 'buffer'},
        {name = 'path'},
        {name = "luasnip"},
    },


    --根据文件类型来选择补全来源
    cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
            {name = 'buffer'}
        })
    }),

    -- 命令模式下输入 `/` 启用补全
    cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
    }),

    -- 命令模式下输入 `:` 启用补全
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
                { name = 'cmdline' }
            })
    }),

    -- 设置补全显示的格式
    formatting = {
        format = lspkind.cmp_format({
            with_text = true,
            maxwidth = 50,
            before = function(entry, vim_item)
                vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
                return vim_item
            end
        }),
    },
})
