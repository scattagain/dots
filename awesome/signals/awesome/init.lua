-- local awesome = require("awesome")
local gears = require("gears")

awesome.connect_signal("startup", function()
    for _, s in pairs(screen[1].clients) do
        s.opacity = 1
        gears.timer {
            timeout = 1,
            autostart = true,
            one_shot = true,
            function ()
                s.opacity = 1
            end
        }
    end
end)
