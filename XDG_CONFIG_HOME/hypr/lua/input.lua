--------------
---- 输入 ----
--------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 ~ 1.0，0 表示不做修改。

        touchpad = {
            natural_scroll = true,
            scroll_factor  = 1.0,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- 按设备配置
-- scroll_factor 小于 1 会缩短滚动距离，大于 1 会放大滚动距离。
-- 更多信息参见 https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/
hl.device({
    name          = "elan0676:00-04f3:3195-touchpad",
    scroll_factor = 1.0,
})

hl.device({
    name          = "tpps/2-elan-trackpoint",
    scroll_factor = 1.0,
})
