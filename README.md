# Antigravity Proxy Launcher (免 TUN 启动器)

轻量、免侵入的 Google Antigravity 2.0 桌面端代理启动工具。解决开启系统代理仍无法连网、必须开启虚拟网卡 (TUN) 模式的痛点。

---

## 痛点背景

Google Antigravity 2.0 采用 Electron 前端 + 后台 Agent Sidecar / gRPC 子进程架构：
1. **系统代理未完全覆盖**：关闭代理软件的 TUN 模式后，普通 Windows 系统代理（WinINET）无法被 Electron 网络协议栈与后台子进程完全捕获。
2. **TUN 模式开销与冲突**：TUN 虚拟网卡模式可能会影响局域网联机、虚拟机网络或引起断流。
3. **软件更新重置参数**：手动在默认快捷方式加参数，每次 Antigravity 自动更新后都会被重置覆盖。

本工具通过进程级环境注入与专属启动器，实现**不开 TUN、不污染全局系统环境变量、软件自动更新永不失效**的代理启动方案。

---

## 特性

- 🚀 **免 TUN 运行**：仅需开启常规 HTTP/SOCKS 代理客户端即可流畅连网。
- 🛡️ **零系统污染**：代理环境变量仅在进程内注入，关闭代理软件后完全不影响 Git、Pip 等命令行工具。
- 🔄 **更新不失效**：独立封装启动器，Antigravity 自动升级后依然生效。
- 📌 **支持固定到任务栏**：提供官方原版图标封装，支持直接固定到 Windows 任务栏。

---

## 快速使用

### 1. 下载项目
点击右上角 `Code` -> `Download ZIP` 下载并解压到你喜欢的目录（例如 `C:\Tools\antigravity-launcher`）。

### 2. 配置端口（可选）
右键用记事本打开 `start_antigravity.bat`，将 `PROXY_PORT` 修改为你代理客户端的本地监听端口：
- **Clash / Mihomo**: 默认 `7890`
- **v2rayN / Xray**: 常用 `10808` 或 `10809`
- **Sing-box**: 常用 `20811`

### 3. 一键创建桌面快捷方式
双击运行 `setup_shortcut.bat`，脚本会自动在桌面生成一个名为 **`Antigravity (Proxy)`** 的快捷方式：
- 已绑定 Antigravity 官方高清图标。
- 运行自动最小化黑框窗口。
- 支持右键点击 **“固定到任务栏”**。

---

## 原理说明

启动器同时解决了两层网络通信：
1. **Electron 前端网络层**：通过注入 `--proxy-server="http://127.0.0.1:端口"` 命令行参数，接管 Chromium 网络协议栈。
2. **后台 Agent / Node / gRPC 子进程**：在进程树启动前注入 `HTTP_PROXY`、`HTTPS_PROXY`、`ALL_PROXY`，让后台模型调度与工具执行自动继承代理通道。

---

## 许可证

MIT License
