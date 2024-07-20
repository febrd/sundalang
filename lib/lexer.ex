defmodule Sundalang.Lexer do
  def tokenize(input) do
    tokens = input
    |> String.split(~r/\n+/)
    |> Enum.flat_map(&tokenize_line/1)

     # IO.inspect(tokens, label: "Tokens")
    tokens
  end

  defp tokenize_line(line) do
    line
    |> String.split(~r/\s+/)
    |> Enum.reject(&(&1 == ""))
    |> tokenize_tokens([])
  end

  defp tokenize_tokens([], acc), do: Enum.reverse(acc)

  defp tokenize_tokens([token | rest], acc) do
    cond do
      String.starts_with?(token, "\"") and not String.ends_with?(token, "\"") ->
        {string_literal, remaining_tokens} = gather_string_literal([token | rest], "")
        tokenize_tokens(remaining_tokens, [{:string, string_literal} | acc])

      String.starts_with?(token, "\"") and String.ends_with?(token, "\"") ->
        tokenize_tokens(rest, [{:string, String.slice(token, 1..(String.length(token) - 1))} | acc])

      true ->
        tokenize_tokens(rest, [classify(token) | acc])
    end
  end

  defp gather_string_literal([token | rest], acc) do
    if String.ends_with?(token, "\"") do
      {acc <> " " <> String.slice(token, 1..(String.length(token) - 1)), rest}
    else
      gather_string_literal(rest, acc <> " " <> token)
    end
  end

  defp classify(word) do
    cond do
      word in ["modulna", "damel", "keun", "cekap", "liren", "upami", "sanesna", "parios", "deleu"] ->
        String.to_atom(word)
      true ->
        {:identifier, word}
    end
  end
end
