defmodule RpnBetter do
    def run(expression) do
        parse(String.split(String.trim(expression)), [])
    end

    def parse([], stack) do
        {:ok, List.first(stack)}
    end

    def parse(["+"|expression], stack) do
        [h|[ht|t]] = stack
        parse(expression, [ht + h | t])
    end

    def parse(["-"|expression], stack) do
        [h|[ht|t]] = stack
        parse(expression, [ht - h | t])
    end

    def parse(["*"|expression], stack) do
        [h|[ht|t]] = stack
        parse(expression, [ht * h | t])
    end

    def parse(["/"|expression], stack) do
        [h|[ht|t]] = stack
        parse(expression, [ht / h | t])
    end

    def parse(expression, stack) do
        [h|t] = expression
        parse(t, [String.to_integer(h) | stack])
    end
end