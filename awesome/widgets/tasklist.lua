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
    end),
    awful.button({}, 3, function()
        awful.menu.client_list({ beautiful = { width = 250 } })
    end),
    awful.button({}, 4, function()
        awful.client.focus.byidx(1)
    end),
    awful.button({}, 5, function()
        awful.client.focus.byidx(-1)
    end)
)

return function(screen)
    return awful.widget.tasklist {
        buttons         = tasklist_buttons,

        screen          = screen,
        filter          = awful.widget.tasklist.filter.focused,
        style           = {
            bg_normal = "#00000000",
            bg_focus  = "#00000000",
            bg_urgent = beautiful.catppuccin.accent,
            fg_urgent = "#000000",

            shape     = gears.shape.rounded_rect,
        },
        layout          = {
            layout = wibox.layout.fixed.horizontal,

            spacing = 5,
        },
        widget_template = {
            id     = 'background_role',
            widget = wibox.container.background,

            {
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
                    widget = wibox.widget.textbox,
                },
            },
        },
    }
end
