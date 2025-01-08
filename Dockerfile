# Gunakan image Windows 10 atau Windows Server
FROM mcr.microsoft.com/windows:10.0.19042.985

# Install dependencies dan aplikasi pendukung
RUN powershell -Command \
    Add-WindowsFeature Remote-Desktop-Services; \
    Add-WindowsFeature RDS-RD-Server; \
    Invoke-WebRequest -Uri https://github.com/novnc/noVNC/archive/refs/heads/master.zip -OutFile C:\novnc.zip; \
    Expand-Archive -Path C:\novnc.zip -DestinationPath C:\novnc; \
    Remove-Item -Path C:\novnc.zip;

# Copy script noVNC ke dalam container
COPY ./start-novnc.ps1 C:/start-novnc.ps1

# Port untuk VNC dan noVNC
EXPOSE 8080 5900

# Jalankan noVNC
CMD ["powershell", "C:/start-novnc.ps1"]
