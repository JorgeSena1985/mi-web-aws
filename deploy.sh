#!/bin/bash

IP="34.241.203.199"
KEY= $HOME/my-key.pem

echo "🚀 Subiendo web a todo pastilla..."
scp -i $KEY -r . ubuntu@$IP:/home/ubuntu/mi-web-aws

echo "🔧 Actualizando servidor..."
ssh -i $KEY ubuntu@$IP << EOF
sudo cp -r /home/ubuntu/web/* /var/www/html/
sudo systemctl restart apache2
EOF

echo "✅ Deploy completado"
