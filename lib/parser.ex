defmodule Sundalang.Parser do
  def parse(tokens) do
    {:ok, program_ast, []} = parse_program(tokens)
    program_ast
  end

  defp parse_program(["modulna" | rest_tokens]) do
    {:ok, module_name, remaining_tokens} = parse_module_name(rest_tokens)
    {:ok, commands_ast, remaining_tokens} = parse_commands(remaining_tokens, [])
    IO.puts "Parsed module: #{module_name}"
    IO.inspect commands_ast
    {:ok, {:program, [{:modulna, module_name} | commands_ast]}, remaining_tokens}
  end

  defp parse_program(_) do
    {:error, "Invalid program structure"}
  end

  defp parse_module_name(["modulna" | rest_tokens]) do
    case Enum.split_while(rest_tokens, &(&1 != "keun")) do
      {[module_name | _], remaining_tokens} ->
        IO.puts "Parsed module name: #{module_name}"
        {:ok, module_name, remaining_tokens}
      _ ->
        {:error, "Module name not found after 'modulna'"}
    end
  end

  defp parse_module_name(_) do
    {:error, "Module definition expected after 'modulna'"}
  end

  defp parse_commands([], acc_ast) do
    IO.inspect Enum.reverse(acc_ast)
    {:ok, Enum.reverse(acc_ast), []}
  end

  defp parse_commands(tokens, acc_ast) do
    case parse_command(tokens) do
      {:ok, command_ast, remaining_tokens} ->
        IO.puts "Parsed command: #{inspect(command_ast)}"
        parse_commands(remaining_tokens, [command_ast | acc_ast])
      {:error, reason} ->
        {:error, reason}
    end
  end

  defp parse_command(["nyieun" | rest_tokens]) do
    case Enum.split_while(rest_tokens, &(&1 != "keun")) do
      {[function_name | _], remaining_tokens} ->
        IO.puts "Parsed function definition: #{function_name}"
        {:ok, [:nyieun, function_name], remaining_tokens}
      _ ->
        {:error, "Function name not found after 'nyieun'"}
    end
  end

  defp parse_command(["deleu" | rest_tokens]) do
    case rest_tokens do
      ["string" | remaining_tokens] ->
        IO.puts "Parsed print statement"
        {:ok, [:deleu, "string"], remaining_tokens}
      _ ->
        {:error, "Expected string after 'deleu'"}
    end
  end

  defp parse_command(["geus" | rest_tokens]) do
    IO.puts "Parsed end of block"
    {:ok, [:geus], rest_tokens}
  end

  defp parse_command(["keun" | _rest_tokens]) do
    {:error, "Unexpected 'keun' found"}
  end

  defp parse_command(["lamun" | rest_tokens]) do
    case Enum.split_while(rest_tokens, &(&1 != "sanesna" && &1 != "ngecheck")) do
      {[condition | _], remaining_tokens} ->
        IO.puts "Parsed if statement with condition: #{condition}"
        {:ok, [:lamun, condition], remaining_tokens}
      _ ->
        {:error, "Condition not found after 'lamun'"}
    end
  end

  defp parse_command(["sanesna" | rest_tokens]) do
    IO.puts "Parsed else statement"
    {:ok, [:sanesna], rest_tokens}
  end

  defp parse_command(["ngecheck" | rest_tokens]) do
    IO.puts "Parsed case statement"
    {:ok, [:ngecheck], rest_tokens}
  end

  defp parse_command([token | _rest_tokens]) do
    {:error, "Unknown token '#{token}'"}
  end

  defp parse_command([]) do
    {:error, "Empty command"}
  end
end
