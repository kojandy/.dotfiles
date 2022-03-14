pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

beautiful.init({
    font = "Pretendard Bold 10",
    border_normal = "#555555",
    border_focus = "#ffffff",
    border_width = dpi(1),
    useless_gap = dpi(10),
    taglist_font = "Material Design Icons 10",
    taglist_bg_focus = "#187bcd",
    taglist_bg_urgent = "#ee4266",
    tasklist_align = "center",
    tasklist_spacing = dpi(2),
    tasklist_disable_icon = true,
    tasklist_bg_normal = "#777777",
    tasklist_bg_focus = "#187bcd",
    tasklist_bg_urgent = "#ee4266",
    tasklist_bg_minimize = "#ffffff00",
    wibar_bg = "#ffffff00",
    wibar_height = dpi(20),
})

awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
}

awful.screen.connect_for_each_screen(function(s)
    gears.wallpaper.maximized("/usr/share/pixmaps/bg.jpg", s)

    s.systray = wibox.widget.systray()
    s.systray.visible = false

    -- web dev doc remote game 6 7 misc chat media
    awful.tag({ "\u{F059F}", "\u{F07B7}", "\u{F09A8}", "\u{F0318}", "\u{F1362}", "6", "7", "\u{F01D8}", "\u{F0B79}", "\u{F075A}" }, s, awful.layout.layouts[1])
    awful.wibar({ position = "top", screen = s }):setup {
        layout = wibox.layout.align.horizontal,
        expand = "none",
        awful.widget.taglist {
            screen  = s,
            filter  = awful.widget.taglist.filter.noempty,
        },
        wibox.widget.textclock("%a, %b %-d   %R"),
        {
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.textbox("\u{F057F}\u{F0580}\u{F057E}"),
            wibox.widget.textbox("  "),
            wibox.widget.textbox("\u{F0079}\u{F007F}"),
            wibox.widget.textbox(" "),
            s.systray,
        }
    }
    s.taskbar = awful.wibar({ position = "top", screen = s, visible = false })
    s.taskbar:setup {
        layout = wibox.layout.flex.horizontal,
        awful.widget.tasklist {
            screen  = s,
            filter  = awful.widget.tasklist.filter.currenttags,
        },
    }
end)

Super = {"Mod4"}
Alt = {"Mod1"}
Super_S = {"Mod4", "Shift"}
Super_C = {"Mod4", "Control"}
Super_C_S = {"Mod4", "Control", "Shift"}

local function autofocus_tiled(c)
    if not c.floating and c.first_tag.layout.name ~= "floating" then
        local next_idx = awful.client.next(1, c) == awful.client.getmaster() and -1 or 1
        awful.client.focus.history.add(awful.client.next(next_idx, c))
    end
end

globalkeys = gears.table.join(
    awful.key(Super, "j", function() awful.client.focus.byidx(1) end),
    awful.key(Super, "k", function() awful.client.focus.byidx(-1) end),
    awful.key(Super_S, "j", function() awful.client.swap.byidx(1) end),
    awful.key(Super_S, "k", function() awful.client.swap.byidx(-1) end),

    awful.key(Super, "h", function() awful.tag.incmwfact(-0.05) end),
    awful.key(Super, "l", function() awful.tag.incmwfact(0.05) end),
    awful.key(Super_S, "h", function() awful.tag.incnmaster(1, nil, true) end),
    awful.key(Super_S, "l", function() awful.tag.incnmaster(-1, nil, true) end),

    awful.key(Super, "m", function()
        client.focus = awful.client.getmaster()
        if client.focus then
            client.focus:raise()
        end
    end),
    awful.key(Super, "u", awful.client.urgent.jumpto),

    awful.key(Super, "Tab", function() awful.tag.history.restore(awful.screen.focused(), "previous") end),
    awful.key(Alt, "Tab", function()
        awful.client.focus.history.previous()
        if client.focus then
            client.focus:raise()
        end
    end),

    awful.key(Super_C, "q", function() awful.spawn("light-locker-command -l", false) end),
    awful.key(Super, "Return", function() awful.spawn("alacritty") end),
    awful.key(Super_S, "w", function() awful.spawn("google-chrome-stable") end),
    awful.key(Super_S, "f", function() awful.spawn("thunar") end),
    awful.key(Alt, "space", function() awful.spawn("rofi -show drun") end),

    awful.key(Super_S, "Escape", awesome.restart),
    awful.key(Super, "grave", function() awful.layout.inc(1) end),

    awful.key(Super_S, "BackSpace", function()
        local c = awful.client.restore()
        if c then
            c:emit_signal("request::activate", "key.unminimize", {raise = true})
        end
    end),

    awful.key(Super, "slash", function()
        local s = awful.screen.focused()
        s.taskbar.visible = not s.taskbar.visible
    end),
    awful.key(Super, "equal", function()
        local s = awful.screen.focused()
        s.systray.visible = not s.systray.visible
    end),

    awful.key({}, "XF86AudioLowerVolume", function() awful.spawn("pamixer -ud 5", false) end),
    awful.key({}, "XF86AudioMute", function() awful.spawn("pamixer -t", false) end),
    awful.key({}, "XF86AudioRaiseVolume", function() awful.spawn("pamixer -ui 5", false) end),

    awful.key({}, "XF86MonBrightnessDown", function() awful.spawn("light -U 10", false) end),
    awful.key({}, "XF86MonBrightnessUp", function() awful.spawn("light -A 10", false) end),

    awful.key({}, "XF86AudioPrev", function() awful.spawn("playerctl previous", false) end),
    awful.key({}, "XF86AudioPlay", function() awful.spawn("playerctl play-pause", false) end),
    awful.key({}, "XF86AudioNext", function() awful.spawn("playerctl next", false) end)
)

clientkeys = gears.table.join(
    awful.key(Super, "q", function(c)
        autofocus_tiled(c)
        c:kill()
    end),
    awful.key(Super, "s", awful.client.floating.toggle),
    awful.key(Super, "f", function(c)
        c.fullscreen = not c.fullscreen
        c:raise()
    end),
    awful.key(Super, "z", function(c)
        c.maximized_vertical = not c.maximized_vertical
        c:raise()
    end),
    awful.key(Super_S, "z", function(c)
        c.maximized = not c.maximized
        c:raise()
    end),
    awful.key(Super, "semicolon", function(c) c:swap(awful.client.getmaster()) end),
    awful.key(Super, "BackSpace", function(c)
        autofocus_tiled(c)
        c.minimized = true
    end)
)
for i = 1, 10 do
    globalkeys = gears.table.join(globalkeys,
        awful.key(Super, "#" .. i + 9, function()
            local screen = awful.screen.focused()
            local tag = screen.tags[i]
            if tag then
                tag:view_only()
            end
        end),
        awful.key(Super_S, "#" .. i + 9, function()
            if client.focus then
                local tag = client.focus.screen.tags[i]
                if tag then
                    autofocus_tiled(client.focus)
                    client.focus:move_to_tag(tag)
                end
            end
        end),
        awful.key(Super_C, "#" .. i + 9, function()
            local screen = awful.screen.focused()
            local tag = screen.tags[i]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end),
        awful.key(Super_C_S, "#" .. i + 9, function()
            if client.focus then
                local tag = client.focus.screen.tags[i]
                if tag then
                    client.focus:toggle_tag(tag)
                end
            end
        end)
    )
end

root.keys(globalkeys)

awful.rules.rules = {
    {
        rule = {},
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            buttons = gears.table.join(
                awful.button({}, 1, function(c)
                    c:emit_signal("request::activate", "mouse_click", {raise = true})
                end),
                awful.button(Super, 1, function(c)
                    c:emit_signal("request::activate", "mouse_click", {raise = true})
                    if c.first_tag.layout.name ~= "floating" then
                        c.floating = true
                    end
                    awful.mouse.client.move(c)
                end),
                awful.button(Super, 2, function(c)
                    c:kill()
                end),
                awful.button(Super, 3, function(c)
                    c:emit_signal("request::activate", "mouse_click", {raise = true})
                    awful.mouse.client.resize(c)
                end)
            ),
            screen = awful.screen.preferred,
            titlebars_enabled = true,
            placement = awful.placement.centered + awful.placement.no_offscreen
        }
    },
    {
        rule_any = {
            class = {"Thunar"},
        },
        properties = {floating = true},
    },
}

client.connect_signal("manage", function (c)
    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        awful.placement.no_offscreen(c)
    end

    if not awesome.startup then
        awful.client.setslave(c)
        local prev_focused = awful.client.focus.history.get(awful.screen.focused(), 1, nil)
        local prev_c = awful.client.next(-1, c)
        if prev_c and prev_focused then
            while prev_c ~= prev_focused do
                c:swap(prev_c)
                prev_c = awful.client.next(-1, c)
            end
        end
    end
end)

client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
