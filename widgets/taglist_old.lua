local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

return function(screen)
    return awful.widget.taglist {
        screen          = screen,
        -- filter          = function(tag)
        --     return tag.selected or (
        --         tag.name ~= "Unnamed" or tag.screen.tags[tag.index - 1].name ~= "Unnamed"
        --     )
        -- end,
        filter          = function(tag)
            return math.abs(tag.screen.selected_tag.index - tag.index) <= 1
        end,
        style           = {
            shape = gears.shape.powerline,
            bg_focus = beautiful.catppuccin.accent,
            fg_focus = beautiful.catppuccin.base,
            bg_empty = beautiful.catppuccin.surface0,
            fg_empty = beautiful.catppuccin.subtext0,
            bg_occupied = beautiful.catppuccin.surface1,
            fg_occupied = beautiful.catppuccin.text
        },
        layout          = {
            spacing = -20,
            layout  = wibox.layout.fixed.horizontal
        },
        widget_template = {
            {
                {
                    {
                        {
                            id     = 'icon_role',
                            widget = wibox.widget.imagebox,
                        },
                        margins = 2,
                        widget  = wibox.container.margin,
                    },
                    {
                        id     = 'text_role',
                        widget = wibox.widget.textbox,
                    },
                    layout = wibox.layout.fixed.horizontal,
                },
                left   = 18,
                right  = 18,
                widget = wibox.container.margin
            },
            id              = 'background_role',
            widget          = wibox.container.background,

            create_callback = function(self, tag, index, objects)
                self.update_callback(self, tag, index, objects)
            end,
            update_callback = function(self, tag, _, _) --luacheck: no unused args
                if tag.selected then
                    screen.tagtextbox = self:get_children_by_id('text_role')[1]
                end
            end,
        },
        buttons         = taglist_buttons
    }
end
