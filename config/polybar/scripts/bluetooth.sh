
#!/bin/sh

if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]; then
  echo ""   # bluetooth disabled
else
  if [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]; then
    echo 󰂲  # no device found
  fi
  echo 󰂯    # connected
fi

