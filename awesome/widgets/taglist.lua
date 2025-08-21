local awful = require("awful")
local wibox = require("wibox")
local rubato = require("rubato")

local taglist_buttons = {
    awful.button {
        modifiers = {},
        button    = 1,
        on_press  = function(t) t:view_only() end,
    },
    awful.button {
        modifiers = {},
        button    = 4,
        on_press  = function(t) awful.tag.viewprev(t.screen) end,
    },
    awful.button {
        modifiers = {},
        button    = 5,
        on_press  = function(t) awful.tag.viewnext(t.screen) end,
    },
}
return function(screen)
    return awful.widget.taglist {
        screen          = screen,
        filter          = awful.widget.taglist.filter.all,
        layout          = {
            spacing = 5,
            layout  = wibox.layout.fixed.horizontal
        },
        widget_template = {
            {
                {
                    {
                        {
                            id     = 'foreground_role',
                            widget = wibox.widget.textbox,
                        },
                        layout = wibox.layout.fixed.horizontal,
                    },
                    id           = "margin",
                    left         = 18,
                    right        = 18,
                    forced_width = 40,
                    widget       = wibox.container.margin
                },
                id     = 'background_role',
                widget = wibox.container.background,
            },
            widget = wibox.container.margin,
            top = 10,
            bottom = 10,

            create_callback = function(self, tag, index, tags)
                local margin = self:get_children_by_id('margin')[1]

                self.size = rubato.timed {
                    intro = 0.1,
                    duration = 0.2,
                    pos = tag.selected and 50 or 40,
                    subscribed = function(width)
                        margin.forced_width = width
                    end
                }
            end,
            update_callback = function(self, tag, _, _)
                if tag.selected then
                    self.size.target = 50
                else
                    self.size.target = 40
                end
            end,
        },
        buttons         = taglist_buttons
    }
end
