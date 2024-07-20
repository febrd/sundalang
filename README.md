### Exploring Sundanese Language Based on Elixir with DSL Concept
<hr>


## Initial Steps

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


### Verifying Installation

After installing Sundalang, follow these steps to ensure everything is set up correctly:

1. **Check Available Commands**

   Run the `sunda` command to display all available commands:

   ```bash
   ┌──(install@Sundalang)-[~/sundalang]
   └─$ sunda
   Available commands:
   sunda pariksa <filename.snd> - Execute a Sundalang program
   sunda hurungkeun - Activate the Sundalang shell
   sunda --version - Display the Sundalang version
   ```

2. **Check Sundalang Version**

   Verify the installed version of Sundalang using the `sunda --version` command:

   ```bash
   ┌──(install@Sundalang)-[~/sundalang]
   └─$ sunda --version
   Sundalang version 0.0.1
   ```

3. **Inside CLI & Sundalang Shell**

   To test basic functionality within the Sundalang shell:

   - **Execute a Sundalang Program**

     Load and execute a Sundalang program file:
   
     ```bash
     ┌──(install@Sundalang)-[~/sundalang]
     └─$ sunda pariksa <path/to/file.snd>
     ```
      ***Inside Sundalang Shell***
     ```bash                      
     ┌──(install㉿sundalang)-[~/sundalang]
     └─$ sunda hurungkeun
      Sundalang shell activated. Type 'atosan' to exit, 'liren' to process buffer content, 'pariksa-file <filename>' to check and execute a file.
      sunda(1)> pariksa-file <path/to/file.snd>
     ```
   - **Create a Simple Function**

     Create a basic function that performs I/O operations:

     ```sundalang
     modulna HelloWorld
       damel hello
        deleu "Hello,Barudak!"
       cekap
     liren

     ```

     Save this script to a file, then run it using:

     ```bash
     ┌──(install@Sundalang)-[~/sundalang]
     └─$ sunda pariksa <path/to/your_script.snd>
     ```

---

Feel free to replace `<filename.snd>` and `<path/to/file.snd>` with the actual file names and paths you are using.
