#!/bin/sh
xrandr --output VIRTUAL1 --off --output DP2 --off --output DP1 --off --output HDMI2 --off --output HDMI1 --off --output eDP1 --auto --output VGA1 --off --output DP2-2 --off
xrandr --output eDP1 --primary
nitrogen --restore
i3-msg restart
