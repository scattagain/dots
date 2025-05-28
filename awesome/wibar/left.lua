local taglist = require('widgets.taglist')
local layoutbox = require('widgets.layoutbox')
local spacing = require('widgets.spacing')
local wibox = require("wibox")

return function(screen)
    return {
        layout = wibox.layout.align.horizontal,
        expand = "none",

        {
            layout = wibox.layout.fixed.horizontal,
            spacing.padding,

            {
                widget = wibox.container.margin,
                top = 5,
                bottom = 5,
                right = 5,

                layoutbox(screen)
            },

            taglist(screen),
            spacing.padding,
        },
    }
end
