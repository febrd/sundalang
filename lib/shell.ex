defmodule Sundalang.Shell do
  def activate_sundalang_shell do
    IO.puts "Sundalang shell activated. Type 'atosan' to exit, 'liren' to process buffer content, 'pariksa-file <filename>' to check and execute a file."
    loop(1, "")
  end

  defp loop(line_number, buffer) do
    IO.write("sunda(#{line_number})> ")
    case IO.read(:line) |> String.trim() do
      "atosan" ->
        IO.puts "Exiting Sundalang shell."
        :ok

      input ->
        new_buffer = if String.contains?(buffer, "liren") do
          buffer <> "\n" <> input
        else
          buffer <> "\n" <> input
        end
        case handle_input(input, new_buffer, line_number) do
          {:ok, updated_buffer} ->
            loop(line_number + 1, updated_buffer)
          :exit ->
            :ok
        end
    end
  end

  defp handle_input("atosan", _buffer, _line_number) do
    IO.puts "Exiting Sundalang shell."
    :exit
  end

  defp handle_input(input, buffer, _line_number) do
    case String.split(input, ~r/\s+/, parts: 2) do
      ["pariksa-file", file] ->
        check_file(file)
        {:ok, buffer}

      ["liren"] ->
        if buffer != "" do
          process_buffer(buffer)
          {:ok, ""}
        else
          {:ok, buffer}
        end

      _ ->
        if String.contains?(buffer, "liren") do
          {:ok, buffer}
        else
          {:ok, buffer}
        end
    end
  end

  defp process_buffer(buffer) do
    buffer
    |> String.split("\n", trim: true)
    |> Enum.reject(&(&1 == ""))
    |> Enum.join("\n")
    |> Sundalang.Lexer.tokenize()
    |> Sundalang.Parser.parse()
    |> Sundalang.Interpreter.run()
  end

  defp check_file(file) do
    case File.read(file) do
      {:ok, code} ->
        tokens = Sundalang.Lexer.tokenize(code)
        Sundalang.Parser.parse(tokens)
        |> Sundalang.Interpreter.run()
      {:error, _reason} ->
        IO.puts "File #{file} not found or cannot be read."
    end
  end
end
