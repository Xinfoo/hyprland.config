hl.monitor({
    output   = "eDP-1",
    mode     = "3072x1920@120.00Hz",
    position = "0x0",
    scale    = "2",
})

hl.on("hyprland.start", function()
	hl.exec_cmd("regreet; hyprctl dispatch 'hl.dsp.exit()'")
end)
hl.config({
	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
        disable_hyprland_guiutils_check = true,
	},
})
