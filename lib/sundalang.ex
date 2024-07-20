defmodule Sundalang do
  alias Sundalang.Lexer
  alias Sundalang.Parser
  alias Sundalang.Interpreter

  def run(input) do
    input
    |> Lexer.tokenize()
    |> Parser.parse()
    |> Interpreter.run()
  end
end
