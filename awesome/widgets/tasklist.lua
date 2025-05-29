local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

local tasklist_buttons = gears.table.join(
    awful.button({}, 1, function(c)
        if c == client.focus then
            c.minimized = true
        else
            c:emit_signal(
                "request::activate",
                "tasklist",
                { raise = true }
            )
        end
    end)
)

local function focused(screen)
    return awful.widget.tasklist {
        buttons         = tasklist_buttons,

        screen          = screen,
        filter          = awful.widget.tasklist.filter.focused,

        widget_template = {
            layout = wibox.layout.fixed.horizontal,

            {
                top = 5,
                bottom = 5,
                right = beautiful.wibar_widget_gap,
                widget  = wibox.container.margin,

                {
                    id     = 'icon_role',
                    widget = wibox.widget.imagebox,
                },
            },

            {
                id     = 'text_role',
                ellipsize = "middle",
                widget = wibox.widget.textbox,
            },
        },
    }
end

local function minimized(screen)
    return awful.widget.tasklist {
        buttons         = tasklist_buttons,

        screen          = screen,
        filter          = awful.widget.tasklist.filter.minimizedcurrenttags,

        widget_template = {
            layout = wibox.layout.fixed.horizontal,
            opacity = 0.5,

            {
                top = 5,
                bottom = 5,
                right = beautiful.wibar_widget_gap,
                widget  = wibox.container.margin,

                {
                    id     = 'icon_role',
                    widget = wibox.widget.imagebox,
                },
            },
        },
    }
end

return {
    focused = focused,
    minimized = minimized
}
