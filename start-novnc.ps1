# Aktifkan layanan VNC
Start-Process -NoNewWindow -FilePath "C:\novnc-master\utils\launch.bat" -ArgumentList "--listen 8080 --vnc localhost:5900"

# Cek status RDP
Get-Service TermService | Start-Service
