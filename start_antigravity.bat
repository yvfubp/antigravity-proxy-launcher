@echo off
:: ========================================================
:: 默认代理端口（Clash: 7890, v2rayN: 10808/10809, Sing-box: 20811）
set PROXY_PORT=10808
set PROXY_HOST=127.0.0.1
:: ========================================================

set HTTP_PROXY=http://%PROXY_HOST%:%PROXY_PORT%
set HTTPS_PROXY=http://%PROXY_HOST%:%PROXY_PORT%
set ALL_PROXY=socks5://%PROXY_HOST%:%PROXY_PORT%
set NO_PROXY=localhost,127.0.0.1,::1

start "" "%LOCALAPPDATA%\Programs\antigravity\Antigravity.exe" --proxy-server="http://%PROXY_HOST%:%PROXY_PORT%"
