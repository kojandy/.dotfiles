#!/bin/bash
player_status=$(playerctl status 2> /dev/null)
title=$(playerctl metadata title 2> /dev/null)
artist=$(playerctl metadata artist 2> /dev/null)

if [ ! "$artist" = "" ]; then
    title=$artist' - '$title
fi

if [ "$player_status" = "Playing" ]; then
    echo " ""$title"
elif [ "$player_status" = "Paused" ]; then
    echo " ""$title"
else
    echo ""
fi
