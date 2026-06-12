hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("VDPAU_DRIVER", "nvidia")

hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

hl.env("NVD_BACKEND", "direct")

hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

hl.env("GDK_BACKEND", "wayland")
hl.env("QT_QPA_PLATFORM", "wayland")

hl.env("GTK_THEME", "Adwaita:dark")

hl.env("MOZ_DISABLE_RDD_SANDBOX", "1")
hl.env("MOZ_ENABLE_WAYLAND", "1")

hl.env("SDL_VIDEO_WAYLAND_SCALE_TO_DISPLAY", "1")

hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("dunst")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
end)
