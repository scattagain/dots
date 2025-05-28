local wibox = require("wibox")
local beautiful = require("beautiful")

local widgetGap = beautiful.wibar_widget_gap
local sectionGap = beautiful.wibar_section_gap
local padding = beautiful.wibar_widget_gap * 4

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
    widgetGap = spacing(widgetGap),
    padding = spacing(padding),
    custom = spacing
}
