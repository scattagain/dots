local awful = require("awful")
local beautiful = require("beautiful")

return {
    tags = { "Primary", "Social", "Reference", "Background", "Recording", "Unnamed", "Unnamed", "Unnamed", "Unnamed" },

    layouts = {
        awful.layout.suit.tile,
        awful.layout.suit.tile.left,
        awful.layout.suit.tile.bottom,
        awful.layout.suit.tile.top,
        awful.layout.suit.fair,
        awful.layout.suit.fair.horizontal,
        awful.layout.suit.spiral,
        awful.layout.suit.spiral.dwindle,
        awful.layout.suit.max,
        awful.layout.suit.magnifier,
        awful.layout.suit.corner.nw,
        -- awful.layout.suit.corner.ne,
        -- awful.layout.suit.corner.sw,
        -- awful.layout.suit.corner.se,
        awful.layout.suit.floating
    }
}
