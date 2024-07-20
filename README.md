### Exploring Sundanese Language Based on Elixir with DSL Concept
<hr>
### Sundalang Installation Guide with Validation

#### Initial Steps

1. **Clone Sundalang Repository**
   - Open your terminal or command prompt based on your operating system.
   - Clone the Sundalang repository from GitHub to your local directory:

     ```bash
     git clone https://github.com/febrd/sundalang.git
     ```


2. **Navigate to the Repository Directory**

   After successfully cloning, navigate into the Sundalang repository directory:

   ```bash
   cd sundalang
   ```

Here’s the updated README.md with installation instructions specifying that the scripts should be run from the `sundalang` folder and directing to `INSTALLATIONS/DISTRO/init.sh`:

---

# Sundalang Installation Guide

## Installing Sundalang

### For Linux (bash and zsh)

1. **Debian-based Distributions**

   ```bash
   ┌──(install@Sundalang)-[~/sundalang]
   └─$ chmod +x INSTALLATIONS/DEBIAN/init.sh
   ┌──(install@Sundalang)-[~/sundalang]
   └─$ ./INSTALLATIONS/DEBIAN/init.sh
   ```

2. **Fedora**

   ```bash
   ┌──(install@Sundalang)-[~/sundalang]
   └─$ chmod +x INSTALLATIONS/RPM/init.sh
   ┌──(install@Sundalang)-[~/sundalang]
   └─$ ./INSTALLATIONS/RPM/init.sh
   ```

3. **Arch Linux**

   ```bash
   ┌──(install@Sundalang)-[~/sundalang]
   └─$ chmod +x INSTALLATIONS/ARCH/init.sh
   ┌──(install@Sundalang)-[~/sundalang]
   └─$ ./INSTALLATIONS/ARCH/init.sh
   ```

4. **Alpine Linux**

   ```bash
   ┌──(install@Sundalang)-[~/sundalang]
   └─$ chmod +x INSTALLATIONS/ALPINE/init.sh
   ┌──(install@Sundalang)-[~/sundalang]
   └─$ ./INSTALLATIONS/ALPINE/init.sh
   ```

### For MacOS (bash and zsh)

```bash
Last-login: Mon Jul 13 12:40:50 on ttys003
MacBook-Pro-User:~ user$ cd path/to/sundalang
MacBook-Pro-User:~ user$ chmod +x INSTALLATIONS/MACOS/init.sh
MacBook-Pro-User:~ user$ ./INSTALLATIONS/MACOS/init.sh
```

### For Windows Command Prompt (cmd)

```cmd
C:\Users\User> cd path\to\sundalang
C:\Users\User\sundalang> init.bat
```

## Supported Distributions

### Linux

- **Debian-based** (e.g., Debian, Ubuntu, Linux Mint)
- **Fedora**
- **Arch Linux**
- **Alpine Linux**

### MacOS

- All versions of MacOS

### Windows

- Windows 10 and later

---

#### Verifying Installation

After installation, verify Sundalang functionality by following these steps:

1. **Check Available Commands**

   Run `sunda` command to display available commands:

   ```bash
   ┌──(install@Sundalang)-[~/sundalang]
   └─$ sunda
   Available commands:
   sunda pariksa <filename.snd> - Execute Sundalang program
   sunda hurungkeun - Activate Sundalang shell
   sunda --version - Display Sundalang version
   ```

2. **Check Sundalang Version**

   Verify the Sundalang version using `sunda --version` command:

   ```bash
   ┌──(install@Sundalang)-[~/sundalang]
   └─$ sunda --version
   Sundalang version 0.0.1
   ```
