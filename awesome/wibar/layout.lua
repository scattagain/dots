local base = require("wibox.widget.base")
local fixed = require("wibox.layout.fixed")
local gtable = require("gears.table")

local layout = {}

function layout:layout(context, width, height)
    local result = {}
    local space_left = width - self._private.spacing * 2
    local left_padding = self._private.spacing

    if self._private.widgets[1] then
        local w, h = base.fit_widget(self, context, self._private.widgets[1], width, height)
        table.insert(result, base.place_widget_at(self._private.widgets[1], 0, 0, w, h))
        space_left = space_left - w
        left_padding = left_padding + w
    end

    if self._private.widgets[3] then
        local w, h = base.fit_widget(self, context, self._private.widgets[3], width, height)
        table.insert(result, base.place_widget_at(self._private.widgets[3], width - w, 0, w, h))
        space_left = space_left - w
    end

    if self._private.widgets[2] then
        local w, h = base.fit_widget(self, context, self._private.widgets[2], space_left, height)
        local x = math.max(width/2 - w/2, left_padding)
        table.insert(result, base.place_widget_at(self._private.widgets[2], x, 0, w, h))
        space_left = space_left - w
    end

    return result
end

function layout:fit(orig_width, orig_height)
    -- this is a lone child, we dont care
    return orig_width, orig_height
end

function layout.horizontal(...)
    local ret = fixed.horizontal(...)
    gtable.crush(ret, layout, true)
    return ret
end

return layout
