defmodule Sundalang do
  def run(input) do
    input
    |> Lexer.Main.tokenize()
    |> Parser.Main.parse()
    |> Interpreter.Main.run()
  end
end
