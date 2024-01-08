defmodule DungeonCrawl.Cli.DifficultyChoice do
  alias Mix.Shell.IO, as: Shell
  import DungeonCrawl.Cli.BaseCommands

  def select do
    Shell.cmd("clear")
    Shell.info("Now select the difficulty level:")

    difficulty_options()
    |> ask_for_option
    |> set_difficulty
  end

  def difficulty_options, do: [:easy, :hard]

  def set_difficulty(difficulty) do
    Shell.cmd("clear")
    difficulty
  end
end
