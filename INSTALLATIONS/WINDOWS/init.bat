# Function to check if a specific command is available
function Check-Command {
    param (
        [string]$Command
    )
    $commandPath = (Get-Command $Command -ErrorAction SilentlyContinue).Source
    return $commandPath -ne $null
}

# Function to compare versions (major.minor)
function Version-Ge {
    param (
        [string]$Version1,
        [string]$Version2
    )
    $v1 = $Version1 -split '\.'
    $v2 = $Version2 -split '\.'

    # Pad versions with zeros if needed
    $v1 += 0 * (2 - $v1.Length)
    $v2 += 0 * (2 - $v2.Length)

    # Compare major and minor versions
    if ($v1[0] -gt $v2[0]) { return $true }
    if ($v1[0] -lt $v2[0]) { return $false }
    if ($v1[1] -gt $v2[1]) { return $true }
    if ($v1[1] -lt $v2[1]) { return $false }
    return $true
}

# Function to check the version of Elixir
function Check-ElixirVersion {
    param (
        [string]$MinVersion
    )
    if (Check-Command "elixir") {
        Write-Output "Checking Elixir version..."
        $installedVersion = (elixir --version) -replace '.*Elixir ', '' -replace ' .*'
        Write-Output "Installed Elixir version: $installedVersion"
        if (Version-Ge $installedVersion $MinVersion) {
            Write-Output "Elixir version $installedVersion is installed."
        } else {
            Write-Output "Error: Elixir version $installedVersion is installed, but at least version $MinVersion is required."
            exit 1
        }
    } else {
        Write-Output "Error: Elixir is not installed."
        exit 1
    }
}

# Function to check the version of Erlang
function Check-ErlangVersion {
    param (
        [string]$MinVersion
    )
    if (Check-Command "erl") {
        Write-Output "Checking Erlang version..."
        $installedVersion = (erl -eval 'erlang:display(erlang:system_info(otp_release)), halt().' -s init stop) -replace '.* ', ''
        Write-Output "Installed Erlang version: $installedVersion"
        if (Version-Ge $installedVersion $MinVersion) {
            Write-Output "Erlang OTP version $installedVersion is installed."
        } else {
            Write-Output "Error: Erlang OTP version $installedVersion is installed, but at least version $MinVersion is required."
            exit 1
        }
    } else {
        Write-Output "Error: Erlang OTP is not installed."
        exit 1
    }
}

# Function to download and install a file
function Download-Install {
    param (
        [string]$Url,
        [string]$FilePath,
        [string]$InstallerPath
    )
    Write-Output "Downloading from $Url..."
    Invoke-WebRequest -Uri $Url -OutFile $FilePath
    Write-Output "Installing $FilePath..."
    Start-Process -FilePath $FilePath -ArgumentList "/S" -Wait
    Remove-Item -Path $FilePath -Force
}

# Define minimum required versions
$MIN_ELIXIR_VERSION = "1.17.0"
$MIN_ERLANG_VERSION = "27.0"

# Check versions
Write-Output "Checking for required versions..."
Check-ElixirVersion $MIN_ELIXIR_VERSION
Check-ErlangVersion $MIN_ERLANG_VERSION

# Install Elixir if not installed
if (-not (Check-Command "elixir")) {
    $elixirUrl = "https://github.com/elixir-lang/elixir/releases/download/v1.17.2/installer-1.17.2.exe"
    $elixirInstaller = "$env:TEMP\elixir_installer.exe"
    Download-Install -Url $elixirUrl -FilePath $elixirInstaller -InstallerPath $elixirInstaller
}

# Install Erlang if not installed
if (-not (Check-Command "erl")) {
    $erlangUrl = "https://github.com/erlang/otp/releases/download/OTP-27.0/otp_win64_27.0.exe"
    $erlangInstaller = "$env:TEMP\erlang_installer.exe"
    Download-Install -Url $erlangUrl -FilePath $erlangInstaller -InstallerPath $erlangInstaller
}

# Build Sundalang
Write-Output "Building Sundalang...."
Start-Process -FilePath "mix" -ArgumentList "escript.build" -Wait -NoNewWindow

# Move executable to PATH
Write-Output "Moving Sundalang executable..."
$destination = "$env:ProgramFiles\Sundalang\sunda.exe"
Move-Item -Path ".\sundalang" -Destination $destination -Force
Write-Output "Sundalang has been installed successfully."
