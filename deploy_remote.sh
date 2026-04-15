#!/bin/bash

IP="52.213.89.124"
KEY="~/mi-clave.pem"

echo "📝 Escribe mensaje de commit:"
read mensaje

echo "📤 Subiendo cambios a GitHub..."
git add .
git commit -m "auto deploy"
git push

echo "🌐 Ejecutando deploy en servidor..."
ssh -i $KEY ubuntu@$IP << EOF
cd ~/apps/mi-web-aws
./deploy_server.sh
EOF

echo "✅ Deploy completo 🚀"
