# 🖥️ PC Health Checker (Bash Script)

A lightweight Bash-based system monitoring tool that displays real-time CPU, RAM, and storage information. The script also sends alerts when usage exceeds safe thresholds and updates automatically every 50 seconds.

---

## 🚀 Features
- Displays CPU model and RAM size
- Shows total and available storage
- Monitors:
  - CPU usage (%)
  - RAM usage (%)
  - Storage used/free (GB)
- Alerts when:
  - CPU usage > 50%
  - RAM usage > 50%
- Auto-refreshes every 50 seconds

---

## 📦 Requirements
- Linux-based system  
- Standard tools: `lscpu`, `free`, `df`, `top`, `awk`, `sed`, `grep`, `bc`

---

## ▶️ Installation & Usage
1. Clone or download the script.
2. Make it executable:
   ```bash
   chmod +x pc_health_checker.sh
