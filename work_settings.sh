#! /bin/sh
#
# work_settings.sh
# Copyright (C) 2018 sjuften <sjuften@linux>
#
# Distributed under terms of the MIT license.
#

xrandr --auto && xrandr --output eDP1 --off && xrandr --output HDMI2 --right-of HDMI1
