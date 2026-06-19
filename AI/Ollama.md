- ```ollama pull llama3.2:latest``` to pull this model
- ```irm https://ollama.com/install.ps1 | iex``` to install ollama
- List installed models: ```ollama list```
- ```ollama run llama3.2:latest``` to run the llm 
- ```ollama run <name of the model from list>``` to run the llm 
- Stop a running model ```ollama stop gemma3```
- Start Ollama ```ollama serve```

Here’s how to check and manage Ollama models (running vs downloaded) and stop them.

---

## ✅ 1. See which models are **currently running**
```bash
ollama ps
```
This shows active models loaded in memory (being served), including:
- Model name
- Size
- Processor (CPU/GPU)
- Time active

If nothing is running, it will show an empty list.

---

## ✅ 2. See which models are **downloaded (installed locally)**
```bash
ollama list
```
This shows all models stored on your system, whether running or not.

---

# 🔴 How to Stop Running Models

## ✅ Stop a specific running model
Use:
```bash
ollama stop <model_name>
```

Example:
```bash
ollama stop llama3
```

Check again:
```bash
ollama ps
```

---

## ✅ Stop all running models at once

Ollama does not have a single built-in "stop all" command, but you can:

### Option 1 – Stop them one by one (scripted)

**Mac/Linux:**
```bash
ollama ps -q | xargs -I {} ollama stop {}
```

**If `-q` doesn't work in your version:**
```bash
ollama ps | awk 'NR>1 {print $1}' | xargs -I {} ollama stop {}
```

---

### Option 2 – Kill the Ollama server completely

If you want to stop everything immediately:

**Mac/Linux:**
```bash
pkill ollama
```

or if running as a service:
```bash
sudo systemctl stop ollama
```

**Windows (PowerShell):**
```powershell
Stop-Process -Name ollama -Force
```

This unloads all models instantly.

---

# 🗑️ If You Also Want to Remove Downloaded Models (Free Disk Space)

List models:
```bash
ollama list
```

Remove one:
```bash
ollama rm <model_name>
```

Example:
```bash
ollama rm llama3
```

---

# 🧠 Quick Summary

| Action | Command |
|--------|----------|
| Show running models | `ollama ps` |
| Show downloaded models | `ollama list` |
| Stop one model | `ollama stop <name>` |
| Stop all models | `ollama ps -q | xargs ollama stop` |
| Kill Ollama server | `pkill ollama` |
| Delete model from disk | `ollama rm <name>` |

---

If you'd like, tell me your OS (Linux, Mac, Windows), and I can tailor the exact safest method for your setup.