local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")

local volume_widget = require('awesome-wm-widgets.volume-widget.volume')
local spotify_widget = require('awesome-wm-widgets.spotify-widget.spotify')
local tasklist = require('widgets.tasklist')
local taglist = require('widgets.taglist')
local layoutbox = require('widgets.layoutbox')

local function spacing(width)
    return wibox.container.margin(
        wibox.widget({}),
        width,
        0,
        0,
        0
    )
end

local widgetGap = spacing(beautiful.wibar_widget_gap)
local sectionGap = spacing(beautiful.wibar_section_gap)
local padding = spacing(beautiful.wibar_widget_gap * 4)


return function(screen)
    local wibar = awful.wibar {
        position = "top",
        screen = screen,
        bg = "#00000000",
        height = beautiful.wibar_height + beautiful.useless_gap * 2,
        width = screen.geometry.width - beautiful.useless_gap * 4,
    }

    wibar:setup {
        layout = wibox.layout.ratio.horizontal,

        {
            left = 0,
            right = 0,
            top = beautiful.useless_gap * 2,
            bottom = 0,
            widget = wibox.container.margin,

            {
                shape = gears.shape.rounded_rect,
                shape_border_width = beautiful.bar_border_width,
                shape_border_color = beautiful.bar_border_color,
                bg = beautiful.bg_normal,
                widget = wibox.container.background,

                {
                    layout = wibox.layout.align.horizontal,
                    expand = "none",

                    -- LEFT
                    {
                        layout = wibox.layout.fixed.horizontal,
                        padding,

                        {
                            widget = wibox.container.margin,
                            top = 5,
                            bottom = 5,
                            right = 5,

                            layoutbox(screen)
                        },

                        taglist(screen),
                        sectionGap
                    },

                    -- MIDDLE
                    tasklist(screen),

                    -- RIGHT
                    {
                        layout = wibox.layout.fixed.horizontal,

                        sectionGap,

                        {
                            margins = beautiful.bar_border_width,
                            widget = wibox.container.margin,

                            wibox.widget.systray()
                        },
                        widgetGap,

                        wibox.widget.textclock("%a %b %d - %I:%M %p "),
                        widgetGap,

                        {
                            bg = beautiful.catppuccin.surface0,
                            shape = gears.shape.rounded_bar,
                            widget = wibox.container.background,
                            {
                                left = 12,
                                right = 12,
                                draw_empty = false,
                                widget = wibox.container.margin,
                                spotify_widget {
                                    sp_bin = gears.filesystem.get_configuration_dir() .. "sp",
                                },
                            }
                        },
                        widgetGap,

                        volume_widget {
                            card = 0,
                            device = "default",
                            widget_type = "horizontal_bar",
                            shape = gears.shape.rounded_bar,
                            width = 60,
                            main_color = beautiful.catppuccin.accent,
                            bg_color = beautiful.catppuccin.surface1,
                        },
                        padding,
                    },
                },
            },
        },
    }
end
