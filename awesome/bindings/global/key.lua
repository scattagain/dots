local awful = require("awful")
local gears = require("gears")
local apps = require("config.apps")

local hotkeys_popup = require("awful.hotkeys_popup")
local mod = require("bindings.mod")

local function move_mouse_onto_focused_client()
    local c = client.focus
    gears.timer({
        timeout = 0.1,
        autostart = true,
        single_shot = true,
        callback = function()
            if mouse.object_under_pointer() ~= c then
                local geometry = c:geometry()
                local x = geometry.x + geometry.width / 2
                local y = geometry.y + geometry.height / 2
                mouse.coords({ x = x, y = y }, true)
            end
        end
    })
end

awful.keyboard.append_global_keybindings {
    awful.key({ mod.super }, "x",
        function() awesome.emit_signal("dashboard::toggle") end,
        { description = "get powermenu", group = "awesome" }),
    awful.key({ mod.super }, "Escape",
        function() awful.spawn.with_shell("~/.config/rofi/scripts/powermenu_t2") end,
        { description = "get powermenu", group = "awesome" }),
    awful.key({ mod.super }, "/", hotkeys_popup.show_help,
        { description = "show help", group = "awesome" }),
    awful.key({ mod.super, }, "Left", awful.tag.viewprev,
        { description = "view previous", group = "tag" }),
    awful.key({ mod.super, }, "Right", awful.tag.viewnext,
        { description = "view next", group = "tag" }),

    awful.key({ mod.super, mod.control }, "Left", function()
            local screen = awful.screen.focused()
            local tag = screen.selected_tag
            local other = screen.tags[tag.index - 1]
            if other or true then tag:swap(other) end
        end,
        { description = "swap with previous", group = "tag" }
    ),
    awful.key({ mod.super, mod.control }, "Right", function()
            local screen = awful.screen.focused()
            local tag = screen.selected_tag
            local other = screen.tags[tag.index + 1]
            if other then tag:swap(other) end
        end,
        { description = "swap with next", group = "tag" }
    ),

    awful.key({ mod.super, }, "j",
        function()
            awful.client.focus.byidx(1)
            move_mouse_onto_focused_client()
        end,
        { description = "focus next by index", group = "client" }
    ),
    awful.key({ mod.super, }, "k",
        function()
            awful.client.focus.byidx(-1)
            move_mouse_onto_focused_client()
        end,
        { description = "focus previous by index", group = "client" }
    ),

    -- Layout manipulation
    awful.key({ mod.super, mod.shift }, "j", function() awful.client.swap.byidx(1) end,
        { description = "swap with next client by index", group = "client" }),
    awful.key({ mod.super, mod.shift }, "k", function() awful.client.swap.byidx(-1) end,
        { description = "swap with previous client by index", group = "client" }),
    awful.key({ mod.super, mod.control }, "j", function() awful.screen.focus_relative(1) end,
        { description = "focus the next screen", group = "screen" }),
    awful.key({ mod.super, mod.control }, "k", function() awful.screen.focus_relative(-1) end,
        { description = "focus the previous screen", group = "screen" }),
    awful.key({ mod.super, }, "u", awful.client.urgent.jumpto,
        { description = "jump to urgent client", group = "client" }),

    -- Standard program
    awful.key({ mod.super, }, "Return", function() awful.spawn(apps.terminal) end,
        { description = "open a terminal", group = "launcher" }),
    awful.key({ mod.super, mod.control }, "r", awesome.restart,
        { description = "reload awesome", group = "awesome" }),
    awful.key({ mod.super, mod.shift }, "q", awesome.quit,
        { description = "quit awesome", group = "awesome" }),
    awful.key({ mod.super, }, "l", function() awful.tag.incmwfact(0.05) end,
        { description = "increase master width factor", group = "layout" }),
    awful.key({ mod.super, }, "h", function() awful.tag.incmwfact(-0.05) end,
        { description = "decrease master width factor", group = "layout" }),
    awful.key({ mod.super, mod.shift }, "h", function() awful.tag.incnmaster(1, nil, true) end,
        { description = "increase the number of master clients", group = "layout" }),
    awful.key({ mod.super, mod.shift }, "l", function() awful.tag.incnmaster(-1, nil, true) end,
        { description = "decrease the number of master clients", group = "layout" }),
    awful.key({ mod.super, mod.control }, "h", function() awful.tag.incncol(1, nil, true) end,
        { description = "increase the number of columns", group = "layout" }),
    awful.key({ mod.super, mod.control }, "l", function() awful.tag.incncol(-1, nil, true) end,
        { description = "decrease the number of columns", group = "layout" }),
    awful.key({ mod.super, }, "space", function() awful.layout.inc(1) end,
        { description = "select next", group = "layout" }),
    awful.key({ mod.super, mod.shift }, "space", function() awful.layout.inc(-1) end,
        { description = "select previous", group = "layout" }),

    awful.key({ mod.super, mod.control }, "n",
        function()
            local c = awful.client.restore()
            -- Focus restored client
            if c then
                c:emit_signal(
                    "request::activate", "key.unminimize", { raise = true }
                )
            end
        end,
        { description = "restore minimized", group = "client" }),

    -- Prompt
    awful.key({ mod.super }, "r", function() awful.spawn.with_shell("~/.config/rofi/scripts/launcher_t1") end,
        { description = "run prompt", group = "launcher" }),
    awful.key({ mod.super }, "s", function() awful.util.spawn("flameshot gui") end,
        { description = "Take screenshot", group = "screen" })
}

awful.keyboard.append_global_keybindings {
    awful.key {
        modifiers   = { mod.super },
        keygroup    = 'numrow',
        description = 'only view tag',
        group       = 'tag',
        on_press    = function(index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:view_only()
            end
        end
    },
    awful.key {
        modifiers   = { mod.super, mod.control },
        keygroup    = 'numrow',
        description = 'swap with tag',
        group       = 'tag',
        on_press    = function(index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                screen.selected_tag:swap(tag)
            end
        end
    },
    awful.key {
        modifiers   = { mod.super, mod.shift },
        keygroup    = 'numrow',
        description = 'move focused client to tag',
        group       = 'tag',
        on_press    = function(index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end
    },
}
