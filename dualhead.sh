#!/bin/sh

# Source: http://www.jejik.com/articles/2008/10/setting_up_dual_monitors_system-wide_with_xrandr_on_debian_lenny/

xrandr | grep VGA1 | grep " connected "

if [$? -eq 0]; then
  # External monitor is connected
  xrandr --output VGA1 --auto --output LVDS1 --auto --left-of VGA1

  if [$? -ne 0]; then
    # Something went wrong. Autoconfigure the internal monitor and disable the external one
    xrandr --output LVDS1 --mode auto --output VGA1 --off
  fi

else
  # External monitor is not connected
  xrandr --output LVDS1 --mode auto --output VGA1 --off
fi
