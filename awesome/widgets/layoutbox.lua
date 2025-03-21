local awful = require("awful")

return function(screen)
    return awful.widget.layoutbox {
        screen = screen,
        -- Add buttons, allowing you to change the layout
        buttons = {
            awful.button({}, 1, function() awful.layout.inc(1) end),
            awful.button({}, 3, function() awful.layout.inc(-1) end),
            awful.button({}, 4, function() awful.layout.inc(1) end),
            awful.button({}, 5, function() awful.layout.inc(-1) end),
        }
    }
end

