#!/bin/sh

# Function to check if a specific command is available
check_command() {
  command -v "$1" >/dev/null 2>&1
}

# Function to compare versions (major.minor)
version_ge() {
  local v1 v2
  IFS='.' read -r -a v1 <<< "$1"
  IFS='.' read -r -a v2 <<< "$2"

  # Pad versions with zeros if needed
  for i in {0..1}; do
    v1[$i]=${v1[$i]:-0}
    v2[$i]=${v2[$i]:-0}
  done

  # Compare major and minor versions
  if [ "${v1[0]}" -gt "${v2[0]}" ]; then
    return 0
  elif [ "${v1[0]}" -lt "${v2[0]}" ]; then
    return 1
  elif [ "${v1[1]}" -gt "${v2[1]}" ]; then
    return 0
  elif [ "${v1[1]}" -lt "${v2[1]}" ]; then
    return 1
  fi

  return 0
}

# Function to check the version of Elixir
check_elixir_version() {
  local min_version=$1
  if check_command "elixir"; then
    echo "Checking Elixir version..."
    installed_version=$(elixir --version | awk '/Elixir/ {print $2}')
    echo "Installed Elixir version: $installed_version"
    if version_ge "$installed_version" "$min_version"; then
      echo "Elixir version $installed_version is installed."
    else
      echo "Error: Elixir version $installed_version is installed, but at least version $min_version is required."
      exit 1
    fi
  else
    echo "Error: Elixir is not installed."
    exit 1
  fi
}

# Function to check the version of Erlang
check_erlang_version() {
  local min_version=$1
  if check_command "erl"; then
    echo "Checking Erlang version..."
    installed_version=$(erl -eval 'erlang:display(erlang:system_info(otp_release)), halt().' -s init stop 2>&1 | awk '{print $2}')
    echo "Installed Erlang version: $installed_version"
    if version_ge "$installed_version" "$min_version"; then
      echo "Erlang OTP version $installed_version is installed."
    else
      echo "Error: Erlang OTP version $installed_version is installed, but at least version $min_version is required."
      exit 1
    fi
  else
    echo "Error: Erlang OTP is not installed."
    exit 1
  fi
}

# Function to install Elixir and Erlang using apk
install_dependencies() {
  echo "Installing Erlang and Elixir..."
  apk add --no-cache erlang elixir
}

# Function to build Sundalang
build_sundalang() {
  echo "Building Sundalang...."
  MIX_ENV=prod mix escript.build > /dev/null
}

# Function to move Sundalang executable
move_executable() {
  echo "Moving Sundalang executable..."
  mv ./sundalang /usr/local/bin/sunda
  chmod +x /usr/local/bin/sunda
}

# Define minimum required versions
MIN_ELIXIR_VERSION="1.17.0"
MIN_ERLANG_VERSION="27.0"

# Check versions
echo "Checking for required versions..."
check_elixir_version "$MIN_ELIXIR_VERSION"
check_erlang_version "$MIN_ERLANG_VERSION"

# Install dependencies if Elixir or Erlang is not installed
if ! check_command "elixir" || ! check_command "erl"; then
  install_dependencies
fi

# Build and move Sundalang executable
build_sundalang
move_executable

echo "Sundalang has been installed successfully."
