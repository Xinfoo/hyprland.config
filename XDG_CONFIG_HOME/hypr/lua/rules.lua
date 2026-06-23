----------------------
---- 窗口与工作区 ----
----------------------

-- 参见 https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- 以及 https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- "智能间隙" / "仅当只有一个窗口时无间隙"
-- 如需使用此功能，请取消下面所有行的注释。
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- 一些实用的窗口规则示例
local suppressMaximizeRule = hl.window_rule({
    -- 忽略所有应用的最大化请求。你大概率会喜欢这个规则。
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- 修复 XWayland 的一些拖拽问题
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- 图层规则同样返回一个句柄。
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run 窗口规则
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})
