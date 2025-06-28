# InaSAFE + QGIS Desktop (via Docker)

This Dockerized environment provides a complete **QGIS Desktop** setup with the **InaSAFE** plugin preinstalled and ready to run directly in your **browser** using a Linux XFCE desktop (via noVNC).

---

##  What's Included

- **Ubuntu 20.04**
- **QGIS LTR (Long-Term Release)** from the official QGIS repository
- **InaSAFE** plugin (installed via `qgis-plugin-manager`)
- **XFCE4 desktop environment**
- **VNC server** and **noVNC** for browser-based GUI access
- **Auto-launching QGIS**
- **Persistent access to your Mac Desktop files** (optional mount)

---

## Quick Start

### 🔨 Build the Docker Image

```bash
docker build -t inasafe-qgis-ltr .
```

---

###  Run the Container

```bash
docker run -it --rm \
  -p 6080:6080 \
  --shm-size=2g \
  -v ~/Desktop:/root/Desktop \
  --name inasafe-qgis \
  inasafe-qgis-ltr
```

> This mounts your Mac's **Desktop** folder into the container at `/root/Desktop`.

---

### Access the GUI

Open your browser and visit:

```
http://localhost:6080
```

- You’ll see a Linux XFCE desktop in your browser.
- QGIS will launch automatically.
- **InaSAFE** will already be installed and enabled.
- You can access your files in `/root/Desktop`.

---

##  Saving and Accessing Files

Save and open files in:

```
/root/Desktop
```

Which maps directly to your real Mac desktop (`~/Desktop`), allowing full persistence between sessions.

---

##  Project Structure

```
inasafe-qgis-docker/
├── Dockerfile       # Installs QGIS + InaSAFE + XFCE + noVNC
├── startup.sh       # Starts XFCE and QGIS in a VNC session
└── README.md        # This file
```

---



## Credits

- [QGIS](https://qgis.org/) — Free and Open Source GIS
- [InaSAFE](https://inasafe.org/) — Disaster risk analysis plugin for QGIS
- [noVNC](https://github.com/novnc/noVNC) — Browser-based VNC access

---

## 📎 License

This project is intended for educational and operational use with open-source software. Please follow respective licenses for QGIS, InaSAFE, and noVNC.
