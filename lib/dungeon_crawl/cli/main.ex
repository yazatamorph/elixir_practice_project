defmodule DungeonCrawl.CLI.Main do
  alias Mix.Shell.IO, as: Shell

  def start_game do
    welcome_message()
    Shell.prompt("Press ENTER to continue...")
    crawl(hero_choice(), DungeonCrawl.Room.all())
  end

  defp crawl(%{hit_points: 0}, _) do
    Shell.prompt("")
    Shell.cmd("clear")

    Shell.info(
      "Weakness overcomes you, and you stumble to the ground as your last drams of blood spill to form a puddle around your broken body."
    )

    Shell.info("The world spins away into merciful blackness...")
    Shell.info("YOU DIED")
    Shell.prompt("")
  end

  defp crawl(character, rooms) do
    Shell.info("You move into the next room.")
    Shell.prompt("Press ENTER to continue...")
    Shell.cmd("clear")

    Shell.info(DungeonCrawl.Character.current_stats(character))

    rooms
    |> Enum.random()
    |> DungeonCrawl.CLI.RoomActionsChoice.start()
    |> trigger_action(character)
    |> handle_action_result
  end

  defp trigger_action({room, action}, character) do
    Shell.cmd("clear")
    room.trigger.run(character, action)
  end

  defp handle_action_result({_, :exit}),
    do: Shell.info("The experience will haunt you, but you managed to escape. Congratulations.")

  defp handle_action_result({character, _}),
    do: crawl(character, DungeonCrawl.Room.all())

  defp welcome_message do
    Shell.info("== The Alchemist's Dungeon ==")
    Shell.info("You awake in a dungeon full of monsters.")
    Shell.info("Survive, if you can, and find the exit!")
  end

  defp hero_choice do
    hero = DungeonCrawl.CLI.HeroChoice.start()
    %{hero | name: "You"}
  end
end
