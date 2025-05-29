local wibox = require("wibox")
local beautiful = require("beautiful")

local padding = beautiful.wibar_widget_gap * 3

local function spacing(width)
    return wibox.container.margin(
        wibox.widget({}),
        width,
        0,
        0,
        0
    )
end

return {
    padding = spacing(padding),
    custom = spacing
}
