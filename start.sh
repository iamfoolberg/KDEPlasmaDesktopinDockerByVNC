#!/bin/bash

export DISPLAY=:1
export NOVNC_PORT=8080
export VNC_PORT=5901

#touch /root/.vnc/passwd
#echo "docker" | vncpasswd -f > /root/.vnc/passwd
#chmod 600 /root/.vnc/passwd

# iniciar servidor vnc\n\
vncserver -kill $DISPLAY || true
vncserver $DISPLAY -geometry 1280x720 -depth 24 -localhost no

# iniciar plasma desktop
startplasma-x11 &

# iniciar novnc\n\
websockify --web=/usr/share/novnc/ --cert=/root/.vnc/self.pem $NOVNC_PORT localhost:$VNC_PORT &
echo "novnc iniciado en http://localhost:$NOVNC_PORT/vnc.html"

# mantener el contenedor activo
tail -f /dev/null
