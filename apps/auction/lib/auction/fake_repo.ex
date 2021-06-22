defmodule Auction.FakeRepo do
  alias Auction.Item

  @items [
    %Item{
      id: 1,
      title: "My first item",
      description: "A tasty item",
      ends_at: ~N[2021-12-01 00:00:00]
    },
    %Item{
      id: 2,
      title: "My second item",
      description: "A secondtasty item",
      ends_at: ~N[2021-11-01 00:00:00]
    },
    %Item{
      id: 3,
      title: "My third item",
      description: "A third tasty item",
      ends_at: ~N[2021-12-11 00:00:00]
    }
  ]

  def all(Item), do: @items

  def get!(Item, id) do
    Enum.find(@items, fn(item) -> item.id === id end)
  end

  def get_by(Item, map) do
    Enum.find(@items, fn(item) ->
      Enum.all?(Map.keys(map), fn(key) ->
          Map.get(item, key) === map[key]
      end)
    end)
  end
end