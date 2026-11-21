#!/usr/bin/env bash
# Pindai kasar rahasia sebelum commit/push. Jalankan: bash scripts/check-secrets.sh
set -u
cd "$(dirname "$0")/.."
pat='(api[_-]?key|secret|passwd|password|token|bearer|private[_-]?key|AKIA[0-9A-Z]{16}|AIza[0-9A-Za-z_-]{35}|sk-[A-Za-z0-9]{20,}|ghp_[A-Za-z0-9]{30,}|-----BEGIN)'
hits=$(grep -rIniE "$pat" --exclude-dir=.git --exclude-dir=node_modules --exclude=check-secrets.sh --exclude=README.md . | grep -vE 'data:image' | cut -c1-160)
if [ -n "$hits" ]; then echo "PERIKSA temuan berikut:"; echo "$hits"; exit 1; fi
echo "Tidak ditemukan pola rahasia."
