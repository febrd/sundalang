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

---
---

# Sundalang VSCode Extension

The Sundalang extension provides syntax highlighting and other features for the Sundalang programming language in Visual Studio Code.

## Installation Guide

### 1. Install via Visual Studio Code Extension Marketplace

1. Open **Visual Studio Code**.
2. Go to the **Extensions** view by clicking the Extensions icon on the Sidebar or pressing `Ctrl+Shift+X`.
3. In the search bar, type `Sundalang` and press `Enter`.
4. Locate the Sundalang extension from the search results.
5. Click the **Install** button to install the extension.

### 2. Install via `.vsix` File

1. Download the `.vsix` file for the Sundalang extension from the [Here](https://github.com/febrd/sundalang/EXTENSION/VSCODE/sundalang-0.0.1.vsix) on GitHub.
2. Open **Visual Studio Code**.
3. Go to the **Extensions** view by clicking the Extensions icon on the Sidebar or pressing `Ctrl+Shift+X`.
4. Click on the three-dot menu (•••) in the top-right corner of the Extensions view and select **"Install from VSIX..."**.
5. Navigate to the downloaded `.vsix` file and select it to install the extension.

### 3. Install via Command Palette

1. Open **Visual Studio Code**.
2. Open the Command Palette by pressing `Ctrl+P` (or `Cmd+P` on macOS).
3. Type the following command and press `Enter`:
   ```sh
   ext install febrid.sundalang
   ```
## Usage

Once installed, the Sundalang extension will provide syntax highlighting for `.snd` files. You can open or create `.snd` files to see the syntax highlighting in action.

For more information or to contribute to the project, visit the [GitHub repository](https://github.com/febrd/sundalang/README.md).

## Support

If you encounter any issues or have questions, please open an issue on the [GitHub issues page](https://github.com/febrd/sundalang/issues).

```