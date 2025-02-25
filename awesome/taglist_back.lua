local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

return function(screen)
    screen.tagtextbox = wibox.widget.textbox()
    return awful.widget.taglist {
        screen          = screen,
        filter          = awful.widget.taglist.filter.selected,
        style           = {
            shape    = gears.shape.powerline,

            bg_focus = beautiful.catppuccin.accent,
            fg_focus = beautiful.catppuccin.surface0
        },
        spacing_widget  = {
            spacing = -12,
            color   = '#dddddd',
            shape   = gears.shape.powerline,
            widget  = wibox.widget.separator,
        },
        widget_template = {
            {
                {
                    {
                        {
                            {
                                id     = "index_role",
                                widget = wibox.widget.textbox,
                            },
                            -- margins = 0,
                            margins = -10,
                            widget  = wibox.container.margin,
                        },
                        bg     = "#00000000",
                        -- fg     = beautiful.catppuccin.surface0,
                        fg     = "#00000000",
                        widget = wibox.container.background,
                    },
                    {
                        id     = "text_role",
                        widget = screen.tagtextbox,
                    },
                    layout = wibox.layout.fixed.horizontal,
                },
                left   = 18,
                right  = 18,
                widget = wibox.container.margin
            },
            id              = "background_role",
            widget          = wibox.container.background,
            -- Add support for hover colors and an index label
            create_callback = function(self, c3, index, objects) --luacheck: no unused args
                self:get_children_by_id("index_role")[1].markup = "<b> " .. c3.index .. " </b>"
                -- self:connect_signal("mouse::enter", function()
                --     if self.bg ~= beautiful.bg_urgent then
                --         self.backup     = self.bg
                --         self.fg_backup  = self.fg
                --         self.has_backup = true
                --     end
                --     self.bg = beautiful.catppuccin.surface0
                --     self.fg = "#ffffffff"
                -- end)
                -- self:connect_signal("mouse::leave", function()
                --     if self.has_backup then self.bg = self.backup; self.fg = self.fg_backup end
                -- end)
            end,
            update_callback = function(self, c3, index, objects) --luacheck: no unused args
                self:get_children_by_id("index_role")[1].markup = "<b> " .. c3.index .. " </b>"
            end,
        }
    }
end
