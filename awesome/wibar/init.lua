local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local left      = require("wibar.left")
local middle    = require("wibar.middle")
local right     = require("wibar.right")
local pill      = require("widgets.pill")

return function(screen)
    local wibar = awful.wibar {
        position = "top",
        screen = screen,
        bg = "#00000000",
        height = beautiful.wibar_height + beautiful.useless_gap * 2,
        width = screen.geometry.width - beautiful.useless_gap * 4,
    }

    wibar:setup {
        layout = wibox.layout.flex.horizontal,

        {
            left = 0,
            right = 0,
            top = beautiful.useless_gap * 2,
            bottom = 0,
            widget = wibox.container.margin,

            {
                layout = wibox.layout.align.horizontal,
                expand = "none",

                pill(left(screen)),

                pill(middle(screen)),

                pill(right())
            }
        },
    }
end
