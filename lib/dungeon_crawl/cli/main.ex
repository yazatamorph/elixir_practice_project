defmodule DungeonCrawl.CLI.Main do
  alias Mix.Shell.IO, as: Shell

  def start_game do
    welcome_message()
    Shell.prompt("Press ENTER to continue...")
    hero_choice()
  end

  defp welcome_message do
    Shell.info("== The Alchemist's Dungeon ==")
    Shell.info("You awake in a dungeon full of monsters.")
    Shell.info("Survive, if you can, and find the exit!")
  end

  defp hero_choice do
    DungeonCrawl.CLI.HeroChoice.start()
  end
end
