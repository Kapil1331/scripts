#!/bin/bash
while true
do
    sleep 1
    state="$(cat /proc/acpi/button/lid/LID0/state | sed 's/^state:\ *//')"
    if [ "$state" == "closed" ]; then
        dbus-send --system --print-reply --dest=org.freedesktop.login1 /org/freedesktop/login1 org.freedesktop.login1.Manager.Suspend boolean:true
    fi
done

