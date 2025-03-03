package.loaded["naughty.dbus"] = {}
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

local awful = require("awful")
local gears = require("gears")

local beautiful = require("beautiful")
beautiful.init(gears.filesystem.get_configuration_dir() .. "theme.lua")

require("rules")
require("bindings")
require("signals")
require("awful.autofocus")
require("awful.hotkeys_popup.keys")

awful.spawn.with_shell(gears.filesystem.get_configuration_dir() .. "autorun.sh")

collectgarbage("incremental", 110, 1000)

local memory_last_check_count = collectgarbage("count")
local memory_last_run_time = os.time()
local memory_growth_factor = 1.1        -- 10% over last
local memory_long_collection_time = 300 -- five minutes in seconds

local gtimer = require("gears.timer")
gtimer.start_new(5, function()
    local cur_memory = collectgarbage("count")
    -- instead of forcing a garbage collection every 5 seconds
    -- check to see if memory has grown enough since we last ran
    -- or if we have waited a sificiently long time
    local elapsed = os.time() - memory_last_run_time
    local waited_long = elapsed >= memory_long_collection_time
    local grew_enough = cur_memory > (memory_last_check_count * memory_growth_factor)
    if grew_enough or waited_long then
        collectgarbage("collect")
        collectgarbage("collect")
        memory_last_run_time = os.time()
    end
    -- even if we didn't clear all the memory we would have wanted
    -- update the current memory usage.
    -- slow growth is ok so long as it doesn't go unchecked
    memory_last_check_count = collectgarbage("count")
    return true
end)
