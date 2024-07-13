defmodule Sundalang.Interpreter do
  def run(ast) do
    case ast do
      {:program, commands} ->
        commands
        |> Enum.map(&translate_command/1)
        |> Enum.join("\n")
      _ ->
        IO.puts "Invalid AST format."
    end
  end

  defp translate_command(command) do
    case command do
      [:nyieun, function_name] -> "def #{function_name}() do"
      [:modulna, module_name] -> "defmodule #{module_name} do"
      [:keun] -> "do"
      [:geus] -> "end"
      [:lamun, condition] -> "if #{condition} do"
      [:sanesna] -> "else"
      [:ngecheck] -> "case"
      [:deleu, message] -> "IO.puts(\"#{message}\")"
      [:modulna | rest] -> "defmodule #{rest} do"
      _ -> "Unknown command."
    end
  end
end
