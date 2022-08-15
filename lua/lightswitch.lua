local warn = function(message)
    vim.api.nvim_echo({{'lightswitch.nvim: ' .. message, 'ErrorMsg'}}, true, {})
end

local M = {}

local light = nil
local dark = nil
local is_dark = nil

M.get_current_scheme = function()
    if is_dark then
        return dark
    else
        return light
    end
end

M.set_theme = function()
    vim.cmd([[ colorscheme ]] .. M.get_current_scheme())
end

M.switch_theme = function()
    is_dark = not is_dark
    M.set_theme()
end

M.indicator = function()
    if not is_dark then
        return '~'
    elseif is_dark then
        return 'o'
    else
        return 'i'
    end
end

M.setup = function(config)
    -- Check config
    if not (config.light or config.dark) then
        warn('Config needs `light` and `dark` fields.')
        return
    end
    light = config.light
    dark = config.dark
    is_dark = config.default or true

    -- Create user command
    vim.api.nvim_create_user_command('LightSwitch', M.switch_theme, {})
end

return M
