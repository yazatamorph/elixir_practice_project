defmodule DungeonCrawl.Room do
  alias DungeonCrawl.Room
  alias DungeonCrawl.Room.Triggers
  import DungeonCrawl.Room.Action

  defstruct description: nil, actions: [], trigger: nil

  def all, do: [
    # %Room{
    #   description: "You've reached a quiet place that looks safe enough for a short nap.",
    #   actions: [forward(), rest()]
    # },
    %Room{
      description: "The light of day filters in through an aperture on the far end of the room. You found the exit!",
      actions: [forward()],
      trigger: Triggers.Exit
    },
    %Room{
      description: "You see the shadowy figure of an enemy blocking your path.",
      actions: [forward()],
      trigger: Triggers.Enemy
    }
  ]
end
