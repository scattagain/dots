local wibox = require("wibox")
local beautiful = require("beautiful")
local tasklist  = require("widgets.tasklist")
local spacing = require("widgets.spacing")

return function(screen)
    return {
        widget = wibox.container.constraint,
        layout = wibox.layout.fixed.horizontal,
        width = 900,

        {
            widget = wibox.container.margin,
            left = beautiful.wibar_widget_gap * 4,
            right = beautiful.wibar_widget_gap * 4,

            {
                layout = wibox.layout.fixed.horizontal,
                spacing = beautiful.wibar_widget_gap,

                tasklist.focused(screen),
                tasklist.unfocused(screen),
            },

            draw_empty = false
        }

    }
end
