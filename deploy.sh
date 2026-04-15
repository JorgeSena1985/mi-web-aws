#!/bin/bash

IP="52.213.89.124"
KEY="~/mi-clave.pem"

echo "🚀 Subiendo web..."
scp -i $KEY -r . ubuntu@$IP:/home/ubuntu/web

echo "🔧 Actualizando servidor..."
ssh -i $KEY ubuntu@$IP << EOF
sudo cp -r /home/ubuntu/web/* /var/www/html/
sudo systemctl restart apache2
EOF

echo "✅ Deploy completado"
