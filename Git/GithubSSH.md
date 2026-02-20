Here’s a step-by-step guide to **generate and add an SSH key from your Ubuntu VPS to GitHub** so you can clone private repos securely:

---

### ✅ 1. Generate SSH Key (on VPS)

Run this command on your VPS:

```bash
ssh-keygen -t ed25519 -C "kmryashasvi@gmail.com"
```

* When asked:

  * **"Enter file in which to save the key"** → Press `Enter` to save to default (`~/.ssh/id_ed25519`)
  * **Passphrase** → Optional (you can leave blank)

---

### ✅ 2. Start SSH agent & add key

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

---

### ✅ 3. Copy public key

```bash
cat ~/.ssh/id_ed25519.pub
```

Copy the output (starts with `ssh-ed25519`).

---

### ✅ 4. Add key to GitHub

1. Go to [GitHub → Settings → SSH and GPG keys](https://github.com/settings/keys)
2. Click **"New SSH key"**
3. Title it something like `"VPS Server"`
4. Paste your copied key and click **"Add SSH key"**

---

### ✅ 5. Test connection

```bash
ssh -T git@github.com
```

If successful, you’ll see:

```
Hi your-username! You've successfully authenticated...
```

---

### ✅ 6. Clone repo using SSH URL

Go to your GitHub repo → Click **Code → SSH tab**, and copy the URL:

```bash
git clone git@github.com:username/repo-name.git
```

---

Let me know if you want to use **a specific key name** or clone as part of a **script or automation**.
