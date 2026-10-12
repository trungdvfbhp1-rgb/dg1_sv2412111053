#!/bin/sh
if [ $# -ne 1 ]; then
  echo "Su dung: $0 <thu_muc>"
  exit 1
fi
if [ ! -d "$1" ]; then
  echo "Loi: Thu muc khong ton tai!"
  exit 2
fi
mkdir -p backup logs
TEN=$(basename "$1")
NGAY=$(date +%Y%m%d_%H%M%S)
TEP="backup/${TEN}_${NGAY}.tar.gz"
tar -czf "$TEP" -C "$(dirname "$1")" "$TEN"
echo "[$(date '+%Y-%m-%d %H:%M:%S')] $TEP" >> logs/backup.log
echo "Xong: $TEP"
