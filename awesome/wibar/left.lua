local taglist = require('widgets.taglist')
local layoutbox = require('widgets.layoutbox')
local spacing = require('widgets.spacing')
local beautiful = require("beautiful")
local wibox = require("wibox")

return function(screen)
    return {
        layout = wibox.layout.fixed.horizontal,
        spacing = beautiful.wibar_widget_gap,

        {
            widget = wibox.container.margin,
            top = 5,
            bottom = 5,
            right = 5,

            layoutbox(screen)
        },

        taglist(screen)
    }
end
