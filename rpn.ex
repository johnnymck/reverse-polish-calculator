defmodule Rpn do
    def compute(expression) do
        step(String.split(String.trim(expression)), [])
    end

    def step([], stack) do
        {:ok, List.first(stack)}
    end

    def step(expression, stack) do
        [h|t] = expression
        cond do
            String.match?(h, ~r/[0-9]+/) ->
                step(t, [String.to_integer(h) | stack])
            h == "+" ->
                add(t, stack)
            h == "-" ->
                sub(t, stack)
            h == "*" ->
                mul(t, stack)
            h == "/" ->
                divi(t, stack)
            h == "p"->
                p(t, stack)
        end
    end

    def add(expression, stack) do
        [h|[ht|t]] = stack
        result = h + ht
        step(expression, [result | t])
    end

    def sub(expression, stack) do
        [h|[ht|t]] = stack
        result = h - ht
        step(expression, [result | t])
    end

    def mul(expression, stack) do
        [h|[ht|t]] = stack
        result = h * ht
        step(expression, [result | t])
    end

    def divi(expression, stack) do
        [h|[ht|t]] = stack
        result = h / ht
        step(expression, [result | t])
    end
    
    def p(expression, stack) do
        IO.inspect(stack)
        step(expression, stack)
    end
end