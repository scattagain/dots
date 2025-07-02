local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")

return function(widget)
    return {
        shape = gears.shape.rounded_rect,
        shape_border_width = beautiful.bar_border_width,
        shape_border_color = beautiful.bar_border_color,
        bg = beautiful.bg_normal,
        widget = wibox.container.background,

        {
            left = beautiful.wibar_widget_gap * 2,
            right = beautiful.wibar_widget_gap * 2,
            draw_empty = false,
            widget = wibox.container.margin,

            widget
        }
    }
end
