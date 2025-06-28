FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV USER=root

# Install system packages and desktop environment
RUN apt update && apt install -y \
    ca-certificates gnupg wget curl software-properties-common lsb-release \
    xfce4 xfce4-goodies tightvncserver xterm \
    novnc websockify python3-pip git nano dbus-x11 x11-utils sudo

# Add QGIS repo and key
RUN mkdir -p /etc/apt/keyrings && \
    wget -qO /etc/apt/keyrings/qgis-archive-keyring.gpg https://download.qgis.org/downloads/qgis-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/qgis-archive-keyring.gpg] \
    https://qgis.org/ubuntu-ltr $(lsb_release -cs) main" > /etc/apt/sources.list.d/qgis.list

# Install QGIS and GRASS plugin
RUN apt update && apt install -y qgis python3-qgis qgis-plugin-grass

# Install InaSAFE plugin via qgis-plugin-manager
RUN pip3 install qgis-plugin-manager && \
    mkdir -p /root/.local/share/QGIS/QGIS3/profiles/default/python/plugins && \
    qgis-plugin-manager install inasafe && \
    sed -i '/\[PythonPlugins\]/a inasafe=true' /root/.local/share/QGIS/QGIS3/profiles/default/QGIS/QGIS3.ini || true

# Create shortcut for QGIS in Applications menu
RUN mkdir -p /root/.local/share/applications && \
    echo "[Desktop Entry]\
\nType=Application\
\nName=QGIS Desktop\
\nExec=qgis\
\nIcon=qgis\
\nCategories=Education;Geography;" \
> /root/.local/share/applications/qgis.desktop

# Clone noVNC
RUN git clone https://github.com/novnc/noVNC.git /opt/novnc && \
    ln -s /opt/novnc/vnc.html /opt/novnc/index.html

# Set default VNC password
RUN mkdir -p ~/.vnc && \
    echo "password" | vncpasswd -f > ~/.vnc/passwd && \
    chmod 600 ~/.vnc/passwd

# Expose VNC and noVNC ports
EXPOSE 5901 6080

# Copy and set permissions for startup script
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

CMD ["/startup.sh"]
