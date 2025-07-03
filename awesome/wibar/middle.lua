local wibox = require("wibox")
local beautiful = require("beautiful")
local tasklist  = require("widgets.tasklist")
local spacing = require("widgets.spacing")
local layout = require("wibar.layout")

return function(screen)
    return {
        layout = layout.prioritizeRight.horizontal,
        spacing = beautiful.wibar_widget_gap * 2,

        tasklist.focused(screen),
        tasklist.unfocused(screen)
    }
end
