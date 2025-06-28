#!/bin/bash

export USER=root

# Ensure XFCE starts with QGIS
mkdir -p ~/.vnc
echo "#!/bin/bash
xrdb $HOME/.Xresources
startxfce4 &
(sleep 5 && qgis) &" > ~/.vnc/xstartup
chmod +x ~/.vnc/xstartup

# Kill old session if any
vncserver -kill :1 > /dev/null 2>&1 || true

# Start VNC session
vncserver :1 -geometry 1280x800 -depth 24

# Start noVNC
/opt/novnc/utils/novnc_proxy --vnc localhost:5901 --listen 6080 &

echo "✅ QGIS Desktop (with InaSAFE) is available at: http://localhost:6080"

# Keep container running
tail -f /dev/null
