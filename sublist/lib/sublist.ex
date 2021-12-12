defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare([], []), do: :equal
  def compare([], _), do: :sublist
  def compare(_, []), do: :superlist
  def compare(a, b) when length(a) < length(b), do: is_sublist(a, b)
  def compare(a, b) when length(a) > length(b), do: is_superlist(a, b)
  def compare(a, b) when length(a) == length(b) do
    if a == b do
      :equal
    else
      :unequal
    end
  end

  def is_sublist([], _), do: :sublist
  def is_sublist(_, []), do: :unequal
  def is_sublist([head_x|tail_x] = x, [head_y|tail_y]) do
    if head_x === head_y do
      if is_consecutive?(tail_x, tail_y) do
        :sublist
      else
        is_sublist(x, tail_y)
      end
    else
      if length(x) <= length(tail_y) do
        is_sublist(x, tail_y)
      else
        :unequal
      end
    end
  end

  def is_superlist(_, []), do: :superlist
  def is_superlist([], _), do: :unequal
  def is_superlist([head_y|tail_y], [head_x|tail_x] = x) do
    if head_x === head_y do
      if is_consecutive?(tail_x, tail_y) do
        :superlist
      else
        is_superlist(tail_y, x)
      end
    else
      if length(x) <= length(tail_y) do
        is_superlist(tail_y, x)
      else
        :unequal
      end
    end
  end

  def is_consecutive?([], _), do: true
  def is_consecutive?(x, y) when length(x) > length(y), do: false
  def is_consecutive?(x, y) when length(x) == length(y), do: x == y
  def is_consecutive?([head_x|tail_x], [head_y|tail_y]) do
    if head_x === head_y do
      is_consecutive?(tail_x, tail_y)
    else
      false
    end
  end
end
