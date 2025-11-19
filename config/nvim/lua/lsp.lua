vim.lsp.config("lua_ls", {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = {
        ".luarc.json",
        }
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
    }
})


vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")
