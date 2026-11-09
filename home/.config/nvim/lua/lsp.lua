local on_attach = function(client, bufnr)
  vim.keymap.set('n', '<leader>fl', vim.lsp.buf.format, { buffer = bufnr, desc = "Format buffer with lsp" })
  vim.keymap.set('n', '<leader>fc', function() require('conform').format() end, { desc = "Format buffer with conform" })
end

vim.lsp.config("lua_ls", {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = {
        ".luarc.json",
        },
    on_attach = on_attach,
    }
)

vim.lsp.config("ts_ls", {
    cmd = { "typescript-language-server", "--stdio" },
    --//commands = {
    --//  ["editor.action.showReferences"] = <function 1>
    --//},
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    --handlers = {
    --  ["_typescript.rename"] = <function 1>
    --},
    init_options = {
      hostInfo = "neovim"
    },
    on_attach = on_attach,
})


vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")
