#!/usr/bin/env bash

SID=$1
ACTIVE=$(aerospace query-workspace)

if [ "$SID" = "$ACTIVE" ]; then
  sketchybar --set space.$SID background.drawing=on icon.color=0xffffffff
else
  sketchybar --set space.$SID background.drawing=off icon.color=0x88ffffff
fi
