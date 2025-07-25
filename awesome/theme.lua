---------------------------
-- Default awesome theme --
---------------------------

local theme_assets                              = require("beautiful.theme_assets")
local xresources                                = require("beautiful.xresources")
local dpi                                       = xresources.apply_dpi

local gears                                     = require("gears")
local gfs                                       = require("gears.filesystem")
local themes_path                               = gfs.get_themes_dir()
local machi                                     = require("layout-machi")

local theme                                     = {}

theme.font                                      = "JetBrainsMono Nerd Font"

theme.catppuccin                                = require("catppuccin").macchiato
theme.catppuccin.accent                         = theme.catppuccin.flamingo

theme.bg_normal                                 = theme.catppuccin.base
theme.bg_focus                                  = theme.catppuccin.surface1
theme.bg_urgent                                 = theme.catppuccin.accent
theme.bg_minimize                               = theme.catppuccin.surface0

theme.fg_normal                                 = theme.catppuccin.subtext0
theme.fg_focus                                  = theme.catppuccin.text
theme.fg_urgent                                 = theme.catppuccin.text
theme.fg_minimize                               = theme.catppuccin.text

theme.useless_gap                               = dpi(5)
theme.border_width                              = dpi(2)
theme.bar_border_width                          = theme.border_width
theme.border_normal                             = theme.catppuccin.surface2
theme.bar_border_color                          = theme.catppuccin.accent
theme.border_focus                              = theme.catppuccin.accent
theme.border_marked                             = theme.catppuccin.overlay0
theme.border_color_active                       = theme.catppuccin.accent

theme.wibar_widget_gap                          = dpi(5)
theme.wibar_section_gap                         = dpi(5)
theme.wibar_height                              = dpi(35)

theme.hotkeys_border_color                      = theme.border_focus
theme.hotkeys_border_width                      = theme.border_width
theme.hotkeys_shape                             = gears.shape.rounded_rect

theme.prompt_fg                                 = "#ff0000"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
theme.taglist_bg_focus = theme.catppuccin.accent
theme.taglist_bg_empty = theme.catppuccin.surface0
theme.taglist_bg_urgent = theme.catppuccin.red
theme.taglist_bg_occupied = theme.catppuccin.surface2
theme.taglist_shape = gears.shape.rounded_bar
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
theme.notification_border_color = theme.border_focus
theme.notification_border_width = theme.border_width
theme.notification_shape = gears.shape.rounded_rect
-- notification_opacity

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon                         = themes_path .. "default/submenu.png"
theme.menu_height                               = dpi(35)
theme.menu_width                                = dpi(700)
theme.menu_border_color                         = theme.border_focus

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal              = themes_path .. "default/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = themes_path .. "default/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal           = themes_path .. "default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus            = themes_path .. "default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive     = themes_path .. "default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = themes_path .. "default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = themes_path .. "default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = themes_path .. "default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive    = themes_path .. "default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = themes_path .. "default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = themes_path .. "default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = themes_path .. "default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive  = themes_path .. "default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = themes_path .. "default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = themes_path .. "default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = themes_path .. "default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path .. "default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path .. "default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = themes_path .. "default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = themes_path .. "default/titlebar/maximized_focus_active.png"

theme.wallpaper                                 = "/usr/share/backgrounds/current"

local function recolor_icon(icon)
        return gears.color.recolor_image(icon, theme.fg_focus)
end

theme.layout_fairh      = recolor_icon(themes_path .. "default/layouts/fairhw.png")
theme.layout_fairv      = recolor_icon(themes_path .. "default/layouts/fairvw.png")
theme.layout_floating   = recolor_icon(themes_path .. "default/layouts/floatingw.png")
theme.layout_magnifier  = recolor_icon(themes_path .. "default/layouts/magnifierw.png")
theme.layout_max        = recolor_icon(themes_path .. "default/layouts/maxw.png")
theme.layout_fullscreen = recolor_icon(themes_path .. "default/layouts/fullscreenw.png")
theme.layout_tilebottom = recolor_icon(themes_path .. "default/layouts/tilebottomw.png")
theme.layout_tileleft   = recolor_icon(themes_path .. "default/layouts/tileleftw.png")
theme.layout_tile       = recolor_icon(themes_path .. "default/layouts/tilew.png")
theme.layout_tiletop    = recolor_icon(themes_path .. "default/layouts/tiletopw.png")
theme.layout_spiral     = recolor_icon(themes_path .. "default/layouts/spiralw.png")
theme.layout_dwindle    = recolor_icon(themes_path .. "default/layouts/dwindlew.png")
theme.layout_cornernw   = recolor_icon(themes_path .. "default/layouts/cornernww.png")
theme.layout_cornerne   = recolor_icon(themes_path .. "default/layouts/cornernew.png")
theme.layout_cornersw   = recolor_icon(themes_path .. "default/layouts/cornersww.png")
theme.layout_cornerse   = recolor_icon(themes_path .. "default/layouts/cornersew.png")
theme.layout_machi      = recolor_icon(machi.get_icon())

-- Generate Awesome icon:
theme.awesome_icon      = theme_assets.awesome_icon(
        theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme        = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
