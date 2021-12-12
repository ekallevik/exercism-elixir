defmodule BoutiqueInventory do
  import Enum
  def sort_by_price(inventory) do
    # Please implement the sort_by_price/1 function
    Enum.sort(inventory, &(&1.price <= &2.price))
  end

  def with_missing_price(inventory) do
    # Please implement the with_missing_price/1 function
    Enum.filter(inventory, &(&1.price == nil))
  end

  def increase_quantity(item, count) do
    # Please implement the increase_quantity/2 function
    quantities = Enum.map(item.quantity_by_size, fn {size, n} -> {size, n + count} end)
    Map.replace(item, :quantity_by_size, Enum.into(quantities, %{}))
  end

  def total_quantity(item) do
    # Please implement the total_quantity/1 function
    item.quantity_by_size
    |> Enum.map(fn {size, n} -> n end)
    |> Enum.reduce(0, fn n, sum -> sum + n end)
  end
end
