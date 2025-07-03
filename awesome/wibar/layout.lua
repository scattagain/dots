local base = require("wibox.widget.base")
local fixed = require("wibox.layout.fixed")
local gtable = require("gears.table")

local alignModified = {}

function alignModified:layout(context, width, height)
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

function alignModified:fit(orig_width, orig_height)
    -- this is a lone child, we dont care
    return orig_width, orig_height
end

function alignModified.horizontal(...)
    local ret = fixed.horizontal(...)
    gtable.crush(ret, alignModified, true)
    return ret
end

-----------------------------

local prioritizeRight = {}

function prioritizeRight:layout(context, width, height)
    local result = {}
    local space_left = width
    local left_padding = 0

    local rightw, _ = base.fit_widget(self, context, self._private.widgets[2], width, height)
    if rightw > 0 then
        space_left = space_left - rightw - self._private.spacing
    end

    local leftw, _ = base.fit_widget(self, context, self._private.widgets[1], space_left, height)
    table.insert(result, base.place_widget_at(self._private.widgets[1], 0, 0, leftw, height))
    if leftw > 0 then
        left_padding = self._private.spacing + leftw
    end

    table.insert(result, base.place_widget_at(self._private.widgets[2], left_padding, 0, rightw, height))

    return result
end

function prioritizeRight:fit(context, orig_width, orig_height)
    local space_left = orig_width
    local w = 0

    local rightw, _ = base.fit_widget(self, context, self._private.widgets[2], orig_width, orig_height)
    if rightw > 0 then
        space_left = space_left - self._private.spacing - rightw
        w = rightw
    end

    local leftw, _ = base.fit_widget(self, context, self._private.widgets[1], space_left, orig_height)
    w = w + leftw

    return w, orig_height
end

function prioritizeRight.horizontal(...)
    local ret = fixed.horizontal(...)
    gtable.crush(ret, prioritizeRight, true)
    return ret
end

return {
    alignModified = alignModified,
    prioritizeRight = prioritizeRight
}

