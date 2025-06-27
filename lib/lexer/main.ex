defmodule Lexer.Main do

  def tokenize(input) do
    input
    |> String.split(~r/\n+/)
    |> Enum.flat_map(&tokenize_line/1)
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
        tokenize_tokens(rest, [{:string, String.slice(token, 1..(String.length(token) - 2))} | acc])

      Regex.match?(~r/^[a-zA-Z_]\w*$/, token) ->
        tokenize_tokens(rest, [classify(token) | acc])

      Regex.match?(~r/^-?\d+$/, token) ->
        tokenize_tokens(rest, [{:number, String.to_integer(token)} | acc])

      String.contains?(token, "()") ->
        {name, _} = String.split_at(token, String.length(token) - 2)
        tokenize_tokens(rest, [:call, {:identifier, name} | acc])

      true ->
        tokenize_tokens(rest, [classify(token) | acc])
    end
  end

  defp gather_string_literal([token | rest], acc) do
    if String.ends_with?(token, "\"") do
      trimmed_token = String.trim(token, "\"")
      final_string = acc <> " " <> trimmed_token
      {String.trim(final_string), rest}
    else
      gather_string_literal(rest, acc <> " " <> token)
    end
  end

  defp classify(word) do
    cond do
      word in ["modulna", "damel", "keun", "cekap", "liren", "upami", "salianna", "parios", "tingal"] ->
        String.to_atom(word)

      word in ["tambahkeun", "kurangkeun", "kalikeun", "bagikeun"] ->
        String.to_atom(word)

      word in ["mun", "salianna", "sareng"] ->
        String.to_atom(word)

      Regex.match?(~r/^\d+$/, word) ->
        {:number, String.to_integer(word)}

      true ->
        {:identifier, word}
    end
  end
end
