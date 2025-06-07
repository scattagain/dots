local awful = require("awful")
local gears = require("gears")
local vars = require("config.vars")
local wibar = require("wibar")
local beautiful = require("beautiful")

screen.connect_signal("request::wallpaper", function(screen)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(screen)
        end
        gears.wallpaper.maximized(wallpaper, screen, true)
    end
end)

awful.screen.connect_for_each_screen(function(screen)
    awful.tag(
        vars.tags,
        screen,
        vars.layouts[1]
    )

    wibar(screen)
    screen.wibar_offset.target = 0
end)
