defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(strand1, strand2) when length(strand1) != length(strand2) do
    {:error, "strands must be of equal length"}
  end

  def hamming_distance('', ''), do: ok(0)

  def hamming_distance(strand1, strand2) do
    strand1
    |> Enum.zip(strand2)
    |> Enum.count(fn {x, y} -> x !== y end)
    |> ok()
  end

  defp ok(count), do: {:ok, count}
end
