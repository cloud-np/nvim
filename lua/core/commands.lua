vim.api.nvim_create_user_command('Browser', function(opts)
    local function browser_exists(name)
        local handle = io.popen('which ' .. name .. ' 2>/dev/null')
        if handle then
            local result = handle:read('*a')
            handle:close()
            return result ~= ''
        end
        return false
    end

    -- Check for brave first, fallback to chrome
    local browser = browser_exists('brave-browser') and 'brave-browser' or 'google-chrome'

    -- Build the command with any arguments passed
    local cmd = browser .. ' ' .. (opts.args or '')
    vim.fn.system(cmd)
end, {
    nargs = '?',  -- Optional arguments
    desc = 'Open URL in browser (Brave or Chrome)'
})
