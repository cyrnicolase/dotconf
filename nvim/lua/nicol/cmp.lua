local cmp = require("cmp")
local lspkind = require("lspkind")
cmp.setup({
    -- 设置代码片段引擎，用于根据代码片段补全
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anymous"](args.body)
        end,
    },

    window = {
    },

    mapping = {
        -- 选择上一个
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        -- 选择下一个
        ['<C-n>'] = cmp.mapping.select_next_item(),
        -- 出现补全
        ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
        -- 取消补全
        ['<A-,>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),

        -- 确认使用某个补全项
        ['<CR>'] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }),

        -- 向上翻页
        ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
        -- 向下翻页
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
    },

    -- 补全来源
    sources = cmp.config.sources({
        {name = 'nvim_lsp'},
        {name = 'vsnip'},
        {name = 'buffer'},
        {name = 'path'}
    }),

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



-- local cmp_status_ok, cmp = pcall(require, "cmp")
-- if not cmp_status_ok then
--   return
-- end
-- 
-- local snip_status_ok, luasnip = pcall(require, "luasnip")
-- if not snip_status_ok then
--   return
-- end
-- 
-- require("luasnip/loaders/from_vscode").lazy_load()
-- 
-- local check_backspace = function()
--   local col = vim.fn.col "." - 1
--   return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
-- end
-- 
-- --   פּ ﯟ   some other good icons
-- local kind_icons = {
--   Text = "",
--   Method = "m",
--   Function = "",
--   Constructor = "",
--   Field = "",
--   Variable = "",
--   Class = "",
--   Interface = "",
--   Module = "",
--   Property = "",
--   Unit = "",
--   Value = "",
--   Enum = "",
--   Keyword = "",
--   Snippet = "",
--   Color = "",
--   File = "",
--   Reference = "",
--   Folder = "",
--   EnumMember = "",
--   Constant = "",
--   Struct = "",
--   Event = "",
--   Operator = "",
--   TypeParameter = "",
-- }
-- -- find more here: https://www.nerdfonts.com/cheat-sheet
-- 
-- cmp.setup {
--   snippet = {
--     expand = function(args)
--       luasnip.lsp_expand(args.body) -- For `luasnip` users.
--     end,
--   },
--   mapping = {
--     ["<C-k>"] = cmp.mapping.select_prev_item(),     -- 选择上一个 以前是 <C-p>
-- 	["<C-j>"] = cmp.mapping.select_next_item(),     -- 选择下一个 以前是 <C-n>
--     ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),     -- 向上翻页
--     ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),      -- 向下翻页
--     ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),      -- 出现补全
--     ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
--     ["<C-e>"] = cmp.mapping {       -- 取消补全
--       i = cmp.mapping.abort(),
--       c = cmp.mapping.close(),
--     },
-- 
--     -- Accept currently selected item. If none selected, `select` first item.
--     -- Set `select` to `false` to only confirm explicitly selected items.
--     ["<CR>"] = cmp.mapping.confirm { select = true },   -- 确认补全
--     ["<Tab>"] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_next_item()
--       elseif luasnip.expandable() then
--         luasnip.expand()
--       elseif luasnip.expand_or_jumpable() then
--         luasnip.expand_or_jump()
--       elseif check_backspace() then
--         fallback()
--       else
--         fallback()
--       end
--     end, {
--       "i",
--       "s",
--     }),
--     ["<S-Tab>"] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_prev_item()
--       elseif luasnip.jumpable(-1) then
--         luasnip.jump(-1)
--       else
--         fallback()
--       end
--     end, {
--       "i",
--       "s",
--     }),
--   },
--   formatting = {
--     fields = { "kind", "abbr", "menu" },
--     format = function(entry, vim_item)
--       -- Kind icons
--       vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
--       -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
--       vim_item.menu = ({
--         luasnip = "[Snippet]",
--         buffer = "[Buffer]",
--         path = "[Path]",
--       })[entry.source.name]
--       return vim_item
--     end,
--   },
--   sources = {
--     { name = "luasnip" },
--     { name = "buffer" },
--     { name = "path" },
--   },
--   confirm_opts = {
--     behavior = cmp.ConfirmBehavior.Replace,
--     select = false,
--   },
--   window = {
--     documentation = cmp.config.window.bordered(),
--   },
--   experimental = {
--     ghost_text = false,
--     native_menu = false,
--   },
-- }
