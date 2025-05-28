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

        widget
    }
end
