return function(opts)
    local terminal    = opts.terminal
    local fileManager = opts.fileManager
    local menu        = opts.menu
    local app_cmd     = opts.app_cmd

    ------------------
    ---- 按键绑定 ----
    ------------------

    local mainMod = "SUPER" -- 将 "Windows" 键设为主要修饰键

    -- 示例按键绑定，更多信息参见 https://wiki.hypr.land/Configuring/Basics/Binds/
    hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
    local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
    -- closeWindowBind:set_enabled(false)
    hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
    hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
    hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
    hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
    hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(app_cmd("chromium")))
    hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(app_cmd("~/.config/waybar/launch.sh")))
    hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
    hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- 仅适用于 dwindle 布局

    -- 使用 mainMod + 方向键移动焦点
    hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
    hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
    hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
    hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

    -- 使用 mainMod + [0-9] 切换工作区
    -- 使用 mainMod + SHIFT + [0-9] 将当前活动窗口移动到指定工作区
    for i = 1, 10 do
        local key = i % 10 -- 10 对应数字键 0
        hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
        hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
    end

    -- 示例：特殊工作区（便签本）
    hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
    hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

    -- 使用 mainMod + 滚轮在现有工作区之间滚动切换
    hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
    hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

    -- 按住 mainMod + 鼠标左键/右键并拖拽来移动/调整窗口大小
    hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
    hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

    -- 笔记本多媒体按键：音量和屏幕亮度
    hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
    hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
    hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
    hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
    hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
    hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

    -- 需要安装 playerctl
    hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
    hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
    hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
    hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
end
