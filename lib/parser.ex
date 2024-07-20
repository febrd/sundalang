defmodule Sundalang.Parser do
  def parse(tokens) do
    {ast, _} = parse_module(tokens, [])
    ast
  end

  defp parse_module(tokens, ast) do
    case tokens do
      [:modulna, {:identifier, name} | rest] ->
        {ast, rest} = parse_functions(rest, [{:module, name} | ast])
        {ast, rest}
      _ ->
        {:error, "Invalid syntax"}
    end
  end

  defp parse_functions(tokens, ast) do
    case tokens do
      [:damel, {:identifier, name} | rest] ->
        {ast, rest} = parse_function(rest, [{:function, name} | ast])
        {ast, rest}
      [:cekap] ->
        {ast, []}
      _ ->
        {:error, "Invalid syntax"}
    end
  end

  defp parse_function(tokens, ast) do
    case tokens do
      [:deleu, {:string, value} | rest] ->
        {[{:function_definition, value} | ast], rest}
      _ ->
        {:error, "Invalid syntax"}
    end
  end
end
