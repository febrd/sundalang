echo "Pastikan Anda sudah menginstal Elixir 1.17 dan Erlang OTP 27.0 terlebih dahulu."

# Build Sundalang escript
MIX_ENV=prod mix escript.build

echo "Building Sundalang...."

# Move executable to /usr/local/bin and make it executable
sudo mv ./sundalang /usr/local/bin/sunda
sudo chmod +x /usr/local/bin/sunda

echo "Sundalang has been installed successfully."
