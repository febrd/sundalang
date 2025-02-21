defmodule Sundalang.Interpreter do
  def run(ast) do
    define_modules(ast)
    execute_function_calls(ast)
  end

  defp define_modules(ast) do
    ast
    |> Enum.each(fn
      {:module, name, functions} ->
        module_name = String.to_atom(name)

        if Code.ensure_loaded?(module_name) do
          :code.purge(module_name)
          :code.delete(module_name)
        end

        Module.create(
          module_name,
          quote do
            defstruct []
            unquote(Enum.map(functions, &generate_elixir_code/1))
          end,
          Macro.Env.location(__ENV__)
        )

      _ ->
        :ok
    end)
  end

  defp execute_function_calls(ast) do
    module_name =
      case ast do
        [{:module, name, _} | _] -> String.to_atom(name)
        _ -> raise "No module defined in AST"
      end

    ast
    |> Enum.each(fn
      {:function_call, name, args} ->
        apply(module_name, String.to_atom(name), args)

      _ ->
        :ok
    end)
  end

  defp generate_elixir_code({:function, name, body}) do
    quote do
      def unquote(String.to_atom(name))() do
        unquote(evaluate_body(body))
      end
    end
  end

  defp evaluate_body(body) do
    Enum.map(body, fn expr ->
      case expr do
        {:print, value} ->
          quote do
            IO.puts(unquote(value))
          end

        {:add, left, right} ->
          quote do
            result = unquote(left) + unquote(right)
            IO.inspect(result)
            result
          end

        {:subtract, left, right} ->
          quote do
            result = unquote(left) - unquote(right)
            IO.inspect(result)
            result
          end

        {:multiply, left, right} ->
          quote do
            result = unquote(left) * unquote(right)
            IO.inspect(result)
            result
          end

        {:divide, left, right} ->
          quote do
            result = unquote(left) / unquote(right)
            IO.inspect(result)
            result
          end



        _ ->
          :ok
      end
    end)
  end
end
