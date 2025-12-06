#!/bin/bash
dnf update -y
dnf install -y python3 python3-pip

mkdir -p /opt/app
cd /opt/app

cat <<'EOF' > requirements.txt
${requirements}
EOF

cat <<'EOF' > app.py
${app_code}
EOF

pip3 install -r requirements.txt

# Create a systemd service
cat <<EOF > /etc/systemd/system/myapp.service
[Unit]
Description=My App
After=network.target

[Service]
User=root
WorkingDirectory=/opt/app
ExecStart=/usr/bin/python3 /opt/app/app.py
Restart=always

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable myapp
systemctl start myapp
