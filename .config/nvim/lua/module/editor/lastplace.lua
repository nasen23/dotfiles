-- restore cursor to file position in previous editing session
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function(args)
        local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
        local line_count = vim.api.nvim_buf_line_count(args.buf)
        if mark[1] > 0 and mark[1] <= line_count then
            vim.api.nvim_buf_call(args.buf, function()
                vim.cmd('normal! g`"zz')
            end)
        end
    end,
})
