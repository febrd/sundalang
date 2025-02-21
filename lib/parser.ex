defmodule Sundalang.Parser do
  def parse(tokens) do
    {ast, _} = parse_statements(tokens, [])
    ast
  end

  defp parse_statements([], ast), do: {Enum.reverse(ast), []}

  defp parse_statements([:modulna, {:identifier, name} | rest], ast) do
    {functions, rest} = parse_functions(rest, [])
    parse_statements(rest, [{:module, name, functions} | ast])
  end

  defp parse_statements([{:identifier, name}, :call | rest], ast) do
    parse_statements(rest, [{:function_call, name, []} | ast])
  end

  defp parse_statements(_, _), do: {:error, "Invalid syntax"}

  defp parse_functions([:damel, {:identifier, name}, :keun | rest], ast) do
    {body, rest} = parse_function_body(rest, [])
    parse_functions(rest, [{:function, name, body} | ast])
  end

  defp parse_functions([:cekap | rest], ast), do: {Enum.reverse(ast), rest}

  defp parse_functions(_, _), do: {:error, "Invalid function syntax"}

  defp parse_function_body([:tingal, {:string, value} | rest], ast) do
    trimmed_value = String.trim(value, "\"")
    parse_function_body(rest, [{:print, trimmed_value} | ast])
  end

  defp parse_function_body([:tambahkeun, {:number, a}, :sareng, {:number, b} | rest], ast) do
    parse_function_body(rest, [{:add, a, b} | ast])
  end

  defp parse_function_body([:tambahkeun, {:number, a}, {:number, b} | rest], ast) do
    parse_function_body(rest, [{:add, a, b} | ast])
  end

  defp parse_function_body([:kurangkeun, {:number, a}, :sareng, {:number, b} | rest], ast) do
    parse_function_body(rest, [{:subtract, a, b} | ast])
  end

  defp parse_function_body([:kurangkeun, {:number, a}, {:number, b} | rest], ast) do
    parse_function_body(rest, [{:subtract, a, b} | ast])
  end
  defp parse_function_body([:kalikeun, {:number, a}, :sareng, {:number, b} | rest], ast) do
    parse_function_body(rest, [{:multiply, a, b} | ast])
  end

  defp parse_function_body([:kalikeun, {:number, a}, {:number, b} | rest], ast) do
    parse_function_body(rest, [{:multiply, a, b} | ast])
  end
  defp parse_function_body([:bagikeun, {:number, a}, :sareng, {:number, b} | rest], ast) do
    parse_function_body(rest, [{:divide, a, b} | ast])
  end

  defp parse_function_body([:bagikeun, {:number, a}, {:number, b} | rest], ast) do
    parse_function_body(rest, [{:divide, a, b} | ast])
  end
  defp parse_function_body([:liren | rest], ast), do: {Enum.reverse(ast), rest}

  defp parse_function_body(_, _), do: {:error, "Invalid function body syntax"}
end
