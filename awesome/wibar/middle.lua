local wibox = require("wibox")
local beautiful = require("beautiful")
local tasklist  = require("widgets.tasklist")

return function(screen)
    return {
        layout = wibox.layout.fixed.horizontal,

        {
            widget = wibox.container.constraint,
            width = 900,

            {
                left = beautiful.wibar_widget_gap * 4,
                right = beautiful.wibar_widget_gap * 4,
                draw_empty = false,
                widget = wibox.container.margin,

                tasklist(screen),
            }
        }
    }
end
