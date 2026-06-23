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
    hl.exec_cmd(utils.app_cmd("fcitx5 -d"))
    hl.exec_cmd(utils.app_cmd("wl-paste --type text --watch cliphist store"))
    hl.exec_cmd(utils.app_cmd("wl-paste --type image --watch cliphist store"))
end)


------------------
---- 引用配置 ----
------------------

require("lua.environment")
require("lua.permissions")
require("lua.appearance")
require("lua.input")
require("lua.binds")({
    terminal    = terminal,
    fileManager = fileManager,
    menu        = menu,
    app_cmd     = utils.app_cmd,
})
require("lua.rules")
