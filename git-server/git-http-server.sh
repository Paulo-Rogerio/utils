#!/bin/bash
set -euo pipefail

BASE_DIR="/tmp/git-serve"
REPO="postgresql-deploy.git"
PORT=8888

mkdir -p "${BASE_DIR}/cgi-bin"

cat > "${BASE_DIR}/cgi-bin/git-http-backend" <<'EOF'
#!/bin/sh
export GIT_PROJECT_ROOT=/tmp/git-serve
export GIT_HTTP_EXPORT_ALL=1
exec git http-backend
EOF

chmod +x "${BASE_DIR}/cgi-bin/git-http-backend"

if [[ ! -d "${BASE_DIR}/${REPO}" ]]; 
then
    git init --bare "${BASE_DIR}/${REPO}"

    git -C "${BASE_DIR}/${REPO}" config http.receivepack true
    git -C "${BASE_DIR}/${REPO}" config http.uploadpack true
    git -C "${BASE_DIR}/${REPO}" update-server-info
fi

cd "${BASE_DIR}"

exec python3 -m http.server --cgi "${PORT}"

