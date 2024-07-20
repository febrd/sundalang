#!/bin/bash

echo "Make sure you have Elixir 1.17 and Erlang OTP 27.0 installed first."

# Build Sundalang escript, suppressing the output message
MIX_ENV=prod mix escript.build > /dev/null

echo "Building Sundalang...."

# Move executable to /usr/local/bin and make it executable
sudo mv ./sundalang /usr/local/bin/sunda
sudo chmod +x /usr/local/bin/sunda

echo "Sundalang has been installed successfully."
