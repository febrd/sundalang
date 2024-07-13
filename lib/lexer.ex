defmodule Sundalang.Lexer do
  def tokenize(code) do
    code
    |> String.split("\n")
    |> Enum.flat_map(&tokenize_line(&1))
  end

  defp tokenize_line(line) do
    line
    |> String.split
    |> Enum.flat_map(&tokenize_token(&1))
  end

  defp tokenize_token(token) do
    case token do
      "nyieun" -> [:nyieun]
      "modulna" -> [:modulna]
      "keun" -> [:keun]
      "geus" -> [:geus]
      "lamun" -> [:lamun]
      "sanesna" -> [:sanesna]
      "ngecheck" -> [:ngecheck]
      "deleu" -> [:deleu]
      _ -> [token]
    end
  end
end
