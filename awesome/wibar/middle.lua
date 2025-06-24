local wibox = require("wibox")
local beautiful = require("beautiful")
local tasklist  = require("widgets.tasklist")

return function(screen)
    return {
        widget = wibox.container.constraint,
        width = 900,

        {

            layout = wibox.layout.fixed.horizontal,

            {
                left = beautiful.wibar_widget_gap * 4,
                right = beautiful.wibar_widget_gap * 2,
                draw_empty = false,
                widget = wibox.container.margin,

                tasklist.focused(screen),

            },

            {
                left = beautiful.wibar_widget_gap * 2,
                right = beautiful.wibar_widget_gap * 4,
                draw_empty = false,
                widget = wibox.container.margin,

                tasklist.unfocused(screen),
            }
        }
    }
end
