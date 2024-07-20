defmodule Sundalang.Interpreter do
  def run(ast) do
    elixir_code = generate_elixir_code(ast)
    {result, _} = Code.eval_string(elixir_code)
    result
  end

  defp generate_elixir_code(ast) do
    case ast do
      [{:function_definition, value}, {:function, _}, {:module, _}] ->
        "IO.puts(\"#{String.replace(value, "\"", "")}\")"
      _ ->
        "IO.puts(\"Invalid AST format.\")"
    end
  end
end
