defmodule DungeonCrawl.Room do
  alias DungeonCrawl.Room
  import DungeonCrawl.Room.Action

  defstruct description: nil, actions: []

  def all, do: [
    %Room{
      description: "You've reached a quiet place that looks safe enough for a short nap.",
      actions: [forward(), rest()]
    }
  ]
end
