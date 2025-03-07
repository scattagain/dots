local awful = require("awful")
local machi = require("layout-machi")

return {
    tags = { "Primary", "Social", "Reference", "Background", "Recording", "Unnamed", "Unnamed", "Unnamed", "Unnamed" },

    layouts = {
        awful.layout.suit.tile,
        awful.layout.suit.tile.left,
        awful.layout.suit.tile.bottom,
        awful.layout.suit.tile.top,
        awful.layout.suit.fair,
        awful.layout.suit.fair.horizontal,
        awful.layout.suit.max,
        awful.layout.suit.magnifier,
        awful.layout.suit.floating,
        machi.default_layout
    }
}
