local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local spotify_widget = require('awesome-wm-widgets.spotify-widget.spotify')
local volume_widget = require('awesome-wm-widgets.volume-widget.volume')

return function()
    return {
        layout = wibox.layout.fixed.horizontal,
        spacing = beautiful.wibar_widget_gap,

        {
            top = beautiful.bar_border_width * 2,
            bottom = beautiful.bar_border_width * 2,
            widget = wibox.container.margin,

            wibox.widget.systray()
        },

        {
            bg = beautiful.catppuccin.surface0,
            shape = gears.shape.rounded_bar,
            widget = wibox.container.background,
            {
                left = 12,
                right = 12,
                draw_empty = false,
                widget = wibox.container.margin,
                spotify_widget {
                    sp_bin = gears.filesystem.get_configuration_dir() .. "sp",
                },
            }
        },


        {
            left = beautiful.wibar_widget_gap,
            right = beautiful.wibar_widget_gap,
            widget = wibox.container.margin,

            wibox.widget.textclock("%a %b %d - %I:%M %p"),
        },


        volume_widget {
            card = 0,
            device = "default",
            widget_type = "horizontal_bar",
            shape = gears.shape.rounded_bar,
            width = 60,
            main_color = beautiful.catppuccin.accent,
            bg_color = beautiful.catppuccin.surface1,
        }
    }
end
