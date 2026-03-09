Here is a **step-by-step guide to share files between two Windows laptops on the same network using Windows built-in file sharing (SMB)**. This lets one laptop access a shared folder from the other.

---

# Step-by-Step: Windows Network Folder Sharing

## 1️⃣ Connect both laptops to the same network

Make sure both laptops are connected to the **same Wi-Fi or LAN**.

Example:

* Same home Wi-Fi
* Same office network

---

## 2️⃣ Turn on Network Discovery and File Sharing

Do this on **both laptops**.

1. Open **Control Panel**
2. Go to **Network and Internet**
3. Click **Network and Sharing Center**
4. Click **Change advanced sharing settings**

Turn ON:

* ✅ **Network discovery**
* ✅ **File and printer sharing**

Click **Save changes**.

---

## 3️⃣ Set network type to Private

Windows blocks sharing on public networks.

1. Open **Settings**
2. Go to **Network & Internet**
3. Click **Wi-Fi** (or Ethernet)
4. Click your network
5. Set **Network profile = Private**

---

## 4️⃣ Share a folder (on Laptop A)

1. Right-click the folder you want to share
2. Click **Properties**
3. Go to the **Sharing** tab
4. Click **Share**

Then:

1. In the dropdown select **Everyone**
2. Click **Add**
3. Set permission:

* **Read** → view only
* **Read/Write** → can edit files

4. Click **Share**

Windows will show something like:

```
\\LaptopA\SharedFolder
```

---

## 5️⃣ Access the folder from Laptop B

On the second laptop:

1. Open **File Explorer**
2. Click the **address bar**
3. Type:

```
\\LaptopA
```

(or the computer name shown earlier)

Press **Enter**.

You should now see the shared folder.

---

## 6️⃣ Optional: Map it as a drive

To make it easier to access:

1. Right-click the shared folder
2. Click **Map network drive**
3. Choose a drive letter (example: Z:)

Now it will appear like a normal drive.

---

# Example

Laptop A name: `OFFICE-PC`

Access from Laptop B:

```
\\OFFICE-PC
```

---

# Common problems (and fixes)

### Can't see the other laptop

Check:

* Both on same network
* Network set to **Private**
* Network discovery **ON**

### Windows asks for password

Disable password protection:

1. Go to **Advanced sharing settings**
2. Turn OFF **Password protected sharing**

---

✅ After this setup, you can **drag and drop files between laptops instantly**.

---

👍 If you want, I can also show you a **much easier method built into Windows that feels like AirDrop and works in 2 clicks** (most people don’t know about it).
