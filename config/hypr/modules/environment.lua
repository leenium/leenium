-- Environment for everything Hyprland starts.

-- Leenium helper scripts (leenium-*). The same path is exported system-wide
-- through /etc/environment.d and /etc/profile.d; adding it here guarantees it
-- is present for processes spawned by the compositor too.
local bin = "/usr/share/leenium/bin"
local path = os.getenv("PATH") or "/usr/local/bin:/usr/bin"
if not path:find(bin, 1, true) then path = bin .. ":" .. path end
hl.env("LEENIUM_PATH", "/usr/share/leenium")
hl.env("PATH", path)

-- Cursor.
hl.env("XCURSOR_THEME", "capitaine-cursors")
hl.env("XCURSOR_SIZE", "30")
hl.env("HYPRCURSOR_SIZE", "30")

-- Toolkit scaling (monitor layout lives in monitors.lua).
hl.env("GDK_SCALE", "2")

-- Toolkits: prefer Wayland, fall back to X11.
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("SDL_VIDEODRIVER", "wayland,x11")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")

-- Session identity (portals use this to pick hyprland-portals.conf).
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
