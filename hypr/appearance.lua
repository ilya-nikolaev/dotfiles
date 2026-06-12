hl.config({
    general = {
        border_size = 1,

        gaps_in = 4,
        gaps_out = 8,

        col = {
            active_border = {
                colors = { "rgba(3c402fff)", "rgba(0a0a0aff)" },
                angle = 45,
            },
            inactive_border = "rgba(3c402fff)",
        },

        no_focus_fallback = true,
    },

    decoration = {
        rounding = 4,

        active_opacity = 1.0,
        inactive_opacity = 0.85,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 2,
            color = "rgba(222612ee)",
        },

        blur = {
            enabled = true,
            size = 4,
            passes = 2,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        preserve_split = true,
    },

    misc = {
        col = {
            splash = "rgba(a3a68fff)",
        },
    },
})

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hl.curve("instant", { type = "bezier", points = { { 0, 1 }, { 0, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 1, bezier = "linear" })
hl.animation({ leaf = "windows", enabled = true, speed = 4, bezier = "easeOutQuint" })

hl.animation({ leaf = "windowsIn", enabled = true, speed = 1, bezier = "instant", style = "popin 50%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1, bezier = "instant", style = "popin 50%" })

hl.animation({ leaf = "fade", enabled = true, speed = 3, bezier = "instant" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1, bezier = "instant" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1, bezier = "instant" })

hl.animation({ leaf = "workspaces", enabled = true, speed = 2, bezier = "instant", style = "slide" })

hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })
