return {
    "rcarriga/nvim-notify",
    config = function()
        local notify = require("notify")
        notify.setup({
            stages = "static",
            timeout = 3000,
            background_colour = "#000000",
            render = "compact",
        })
        vim.notify = notify

        -- Show save notification
        vim.api.nvim_create_autocmd("BufWritePost", {
            callback = function()
                local filename = vim.fn.expand("%:t")
                local lines = vim.fn.line("$")
                local bytes = vim.fn.wordcount().bytes
                vim.notify(string.format('"%s" %dL %dB written', filename, lines, bytes), vim.log.levels.INFO)
            end,
        })
    end,
}
