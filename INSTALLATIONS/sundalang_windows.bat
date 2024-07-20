REM Make sure you have Elixir 1.17 and Erlang OTP 27.0 installed first.

REM Build escript and suppress the output message
set MIX_ENV=prod
mix escript.build > nul

REM Copy executable to the desired directory
copy .\sundalang.exe "C:\Program Files\Sundalang\sunda.exe"

echo Sundalang CLI telah terinstal.
