defmodule Sundalang.CLI do
  def main(args) do
    run(args)
  end

  def run(args) do
    case args do
      ["pariksa" | [file | _]] -> execute_sundalang(file)
      ["hurungkeun"] -> Sundalang.Shell.activate_sundalang_shell()
      ["--version"] -> display_version()
      _ -> display_available_commands()
    end
  end

  defp execute_sundalang(file) do
    case File.read(file) do
      {:ok, code} ->
        tokens = Sundalang.Lexer.tokenize(code)
        Sundalang.Parser.parse(tokens)
        |> Sundalang.Interpreter.run()
      {:error, _reason} ->
        IO.puts "File not found or cannot be read."
    end
  end

  defp display_version do
    version = Application.spec(:sundalang, :vsn) || "undefined"
    IO.puts "Sundalang version #{version}"
  end

  defp display_available_commands do
    IO.puts """
    Available commands:
    sunda pariksa <filename.snd> - Execute Sundalang program
    sunda hurungkeun - Activate Sundalang shell
    sunda --version - Display Sundalang version
    """
  end
end
