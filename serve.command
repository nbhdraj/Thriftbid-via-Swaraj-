#!/bin/zsh

cd "$(dirname "$0")"
python3 -m http.server 8000 --bind 127.0.0.1 &
TB_SERVER_PID=$!
trap 'kill "$TB_SERVER_PID" 2>/dev/null' EXIT INT TERM

until curl -fsS "http://127.0.0.1:8000/login-1.html" >/dev/null 2>&1; do
  sleep 0.1
done

open "http://127.0.0.1:8000/login-1.html"
wait "$TB_SERVER_PID"
