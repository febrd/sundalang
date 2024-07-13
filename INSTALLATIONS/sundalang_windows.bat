REM Pastikan Anda sudah menginstal Elixir 1.17 dan Erlang OTP 27.0 terlebih dahulu.

REM Build escript
set MIX_ENV=prod
mix escript.build

REM Salin executable ke direktori yang diinginkan
copy .\sundalang.exe "C:\Program Files\Sundalang\sunda.exe"

echo Sundalang CLI telah terinstal.
