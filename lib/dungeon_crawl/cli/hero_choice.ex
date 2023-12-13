defmodule DungeonCrawl.CLI.HeroChoice do
  alias Mix.Shell.IO, as: Shell
  import DungeonCrawl.CLI.BaseCommands

  def start do
    Shell.cmd("clear")
    Shell.info("Who are you, stranger?")

    heroes = DungeonCrawl.Heroes.all()
    find_hero_by_index = &Enum.at(heroes, &1)

    heroes
    |> Enum.map(&(&1.name))
    |> display_options
    |> generate_question
    |> Shell.prompt
    |> parse_answer
    |> find_hero_by_index.()
    |> confirm_hero
  end

  defp confirm_hero(choice) do
    Shell.cmd("clear")
    Shell.info(choice.description)
    if Shell.yes?("Is this correct?"), do: choice, else: start()
  end
end
