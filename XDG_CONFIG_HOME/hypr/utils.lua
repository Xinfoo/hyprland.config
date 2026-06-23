local M = {}

function M.app_cmd(command)
    local escaped = command:gsub("'", "'\\''")
    return "sh -lc 'if command -v uwsm >/dev/null 2>&1; then uwsm app -- " .. escaped .. " || exec " .. escaped .. "; else exec " .. escaped .. "; fi'"
end

return M
