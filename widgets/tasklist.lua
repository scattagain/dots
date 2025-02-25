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
        filter          = awful.widget.tasklist.filter.currenttags,
        style           = {
            bg_normal = beautiful.catppuccin.surface0,
            bg_focus  = beautiful.catppuccin.surface1,
            bg_urgent = beautiful.catppuccin.accent,
            fg_urgent = "#000000",

            shape     = gears.shape.rounded_rect,
        },
        layout          = {
            layout = wibox.layout.fixed.horizontal,

            spacing = 5,
            -- spacing_widget = {
            --     valign = "center",
            --     halign = "center",
            --     widget = wibox.container.place,

            --     {
            --         forced_width = 5,
            --         shape        = gears.shape.circle,
            --         widget       = wibox.widget.separator
            --     },
            -- },
        },
        widget_template = {
            {
                id     = 'background_role',
                widget = wibox.container.background,
                {
                    widget = wibox.container.margin,
                    margins = 5,
                    {
                        id     = 'clienticon',
                        widget = awful.widget.clienticon,
                    },
                }
            },
            nil,
            create_callback = function(self, c, index, objects) --luacheck: no unused args
                self:get_children_by_id('clienticon')[1].client = c
            end,
            layout = wibox.layout.align.vertical,
        },
    }
end
