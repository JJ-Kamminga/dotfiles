local group = vim.api.nvim_create_augroup('WrapSettings', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  group = group,
  pattern = { 'markdown', 'text' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.breakindent = true
  end,
})

