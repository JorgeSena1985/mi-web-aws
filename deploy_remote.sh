#!/bin/bash

IP="34.241.203.199"
KEY="$HOME/my-key.pem"

echo "📝 Escribe mensaje de commit:"
read mensaje

echo "📤 Subiendo cambios a GitHub..."
git add .
git commit -m "$mensaje" 
git push

echo "🌐 Ejecutando deploy en servidor..."
ssh -i $KEY ubuntu@$IP << EOF
cd ~/apps/mi-web-aws
./deploy_server.sh
EOF

echo "✅ Deploy completo 🚀"
