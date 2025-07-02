local wibox = require("wibox")
local beautiful = require("beautiful")
local tasklist  = require("widgets.tasklist")
local spacing = require("widgets.spacing")

return function(screen)
    return {
        widget = wibox.container.constraint,
        layout = wibox.layout.fixed.horizontal,
        spacing = beautiful.wibar_widget_gap,
        width = 900,

        tasklist.focused(screen),
        tasklist.unfocused(screen)
    }
end
