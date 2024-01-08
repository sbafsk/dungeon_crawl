defmodule DungeonCrawl.Room.Triggers.Exit do
  @behaviour DungeonCrawl.Room.Trigger

  def run(character, _, difficulty), do: {character, :exit, difficulty}
end
