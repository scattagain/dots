local awful = require("awful")
local cairo = require("lgi").cairo

awful.rules.rules = {
    -- All clients will match this rule.
    {
        rule = {},
        properties = {
            focus = awful.client.focus.filter,
            raise = true,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen
        }
    },
    -- Floating clients.
    {
        rule_any = {
            instance = {
                "DTA",   -- Firefox addon DownThemAll.
                "copyq", -- Includes session name in class.
                "pinentry",
            },
            class = {
                "Arandr",
                "Blueman-manager",
                "Gpick",
                "Kruler",
                "MessageWin",  -- kalarm.
                "Sxiv",
                "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
                "Wpa_gui",
                "veromix",
                "xtightvncviewer" },

            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
            name = {
                "Event Tester", -- xev.
            },
            role = {
                "AlarmWindow",   -- Thunderbird's calendar.
                "ConfigManager", -- Thunderbird's about:config.
                "pop-up",        -- e.g. Google Chrome's (detached) Developer Tools.
            }
        },
        properties = { floating = true }
    },

    {
        rule_any = { type = { "normal", "dialog" } },
        properties = {
            titlebars_enabled = false,
        }
    },

    {
        rule = { class = "vesktop" },
        properties = { tag = "Social" }
    },

    {
        rule = { name = "Freya App" }, -- Orbolay
        properties = {
            maximized = true,
            ontop = true,
            skip_taskbar = true,
            focusable = false,
            sticky = true
        },

        -- Input Passthrough
        callback = function(c)
            local img = cairo.ImageSurface(cairo.Format.A1, 0, 0)
            c.shape_input=img._native
            img.finish()
        end
    },

    {
        rule = { class = "controll" }, -- Ignore :3
        properties = {
            floating = true,
            x = 0,
            y = 0,
            width = 1920,
            height = 1080,
            border_width = 0,
            ontop = true,
            focusable = false,
            sticky = true
        },

        callback = function(c)
            local img = cairo.ImageSurface(cairo.Format.A1, 0, 0)
            c.shape_input=img._native
            img.finish()
        end
    },

    rule = { class = "kando" },
        properties = {
            fullscreen = true,
            ontop = true,
            border_width = 0
        }
    }

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = "2" } },
-- }}}
