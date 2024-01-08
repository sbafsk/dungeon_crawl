defmodule DungeonCrawl.Cli.Main do
  alias Mix.Shell.IO, as: Shell

  def start_game do
    welcome_message()

    crawl(
      hero_choice(),
      DungeonCrawl.Room.all(),
      DungeonCrawl.Cli.DifficultyChoice.select()
    )
  end

  defp hero_choice do
    hero = DungeonCrawl.Cli.HeroChoice.start()
    %{hero | name: "You"}
  end

  defp crawl(%{hit_points: 0}, _, _) do
    # GAME OVER
    Shell.prompt("")
    Shell.cmd("clear")
    Shell.info("Unfortunately your wounds are too many to keep walking.")
    Shell.info("You fall onto the floor witout strenth to carry on.")
    Shell.info("Game Over!")
    Shell.prompt("")
  end

  defp crawl(character, rooms, difficulty) do
    Shell.info("You keep moving forward to the next room.")
    Shell.prompt("Press Enter to continue")
    Shell.cmd("clear")

    Shell.info(DungeonCrawl.Character.current_stats(character))

    rooms
    |> Enum.random()
    |> DungeonCrawl.Cli.RoomActionsChoice.start()
    |> trigger_action(character, difficulty)
    |> handle_action_result
  end

  defp welcome_message do
    Shell.cmd("clear")
    Shell.info("=== Dungeon Crawl ===")
    Shell.info("You awake in a dungeon full of monsters.")
    Shell.info("You need to survice and find the exit.")
    Shell.prompt("Press Enter to continue")
  end

  defp trigger_action({room, action}, character, difficulty) do
    Shell.cmd("clear")
    room.trigger.run(character, action, difficulty)
  end

  defp handle_action_result({_, :exit, _}),
    do: Shell.info("You found the exit. You win the game. Congratulations!")

  defp handle_action_result({character, _, difficulty}),
    do: crawl(character, DungeonCrawl.Room.all(), difficulty)
end
