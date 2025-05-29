local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local left      = require("wibar.left")
local right     = require("wibar.right")
local spacing   = require("widgets.spacing")
local pill      = require("widgets.pill")
local tasklist  = require("widgets.tasklist")

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
                expand = "outside",

                {
                    halign = "left",
                    widget = wibox.container.place,

                    pill(left(screen)),
                },

                pill {
                    layout = wibox.layout.fixed.horizontal,

                    {
                        left = beautiful.wibar_widget_gap * 4,
                        right = beautiful.wibar_widget_gap * 4,
                        draw_empty = false,
                        widget = wibox.container.margin,

                        tasklist(screen),
                    }
                },


                {
                    halign = "right",
                    widget = wibox.container.place,

                    pill(right())
                }
            }
        },
    }
end
