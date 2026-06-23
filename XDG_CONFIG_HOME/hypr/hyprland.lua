-- 这是一个 Hyprland Lua 配置文件。
-- 更多信息请参考 wiki。
-- https://wiki.hypr.land/Configuring/Start/

require("monitors")

local utils = require("utils")


------------------
---- 我的程序 ----
------------------

-- 设置你使用的程序
local terminal    = "alacritty"
local fileManager = "thunar"
local menu        = "hyprlauncher"


----------------
---- 自启动 ----
----------------

-- 参见 https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function()
    hl.exec_cmd(utils.app_cmd("~/.config/waybar/launch.sh"))
    hl.exec_cmd(utils.app_cmd("nm-applet"))
end)

require("environment")
require("permissions")
require("appearance")
require("input")
require("binds")({
    terminal    = terminal,
    fileManager = fileManager,
    menu        = menu,
    app_cmd     = utils.app_cmd,
})
require("rules")
