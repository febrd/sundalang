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

#### Installing Sundalang

##### For Linux (bash and zsh)

```bash
┌──(install@Sundalang)-[~/project/sundalang]
└─$ cd INSTALLATIONS
┌──(install@Sundalang)-[~/project/sundalang/INSTALLATIONS]
└─$ chmod +x sundalang_linux_mac.sh.sh
┌──(install@Sundalang)-[~/project/sundalang/INSTALLATIONS]
└─$ ./sundalang_linux_mac.sh
```

##### For MacOS (bash and zsh)

```bash
Last-login: Mon Jul 13 12:40:50 on ttys003
MacBook-Pro-User:~ user$ cd sundalang/INSTALLATIONS
MacBook-Pro-User:INSTALLATIONS user$ chmod +x sundalang_linux_mac.sh
MacBook-Pro-User:INSTALLATIONS user$ ./sundalang_linux_mac.sh
```

##### For Windows Command Prompt (cmd)

```cmd
C:\Users\User> cd path\to\sundalang\INSTALLATIONS
C:\Users\User\sundalang\INSTALLATIONS> sundalang_windwos.bat
```

#### Verifying Installation

After installation, verify Sundalang functionality by following these steps:

1. **Check Available Commands**

   Run `sunda` command to display available commands:

   ```bash
   ┌──(install@Sundalang)-[~/project/sundalang]
   └─$ sunda
   Available commands:
   sunda lumpat <filename.snd> - Execute Sundalang program
   sunda hurungkeun - Activate Sundalang shell
   sunda --version - Display Sundalang version
   ```

2. **Check Sundalang Version**

   Verify the Sundalang version using `sunda --version` command:

   ```bash
   ┌──(install@Sundalang)-[~/project/sundalang]
   └─$ sunda --version
   Sundalang version 0.0.1-dev
   ```
