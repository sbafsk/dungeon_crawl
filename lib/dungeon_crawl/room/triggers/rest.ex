defmodule DungeonCrawl.Room.Triggers.Rest do
  @behaviour DungeonCrawl.Room.Trigger

  alias DungeonCrawl.Room.Action
  alias Mix.Shell.IO, as: Shell

  def run(character, %Action{id: :forward}, difficulty) do
    Shell.info("You're walking cautiosly and can see the next room.")
    {character, :forward, difficulty}
  end

  def run(character, %Action{id: :rest}, difficulty) do
    healing = if difficulty == :easy, do: 5, else: 3
    Shell.info("You search the room for a confortable place to rest.")
    Shell.info("After a little rest you regain #{healing} hit points.")

    {
      DungeonCrawl.Character.heal(character, healing),
      :forward,
      difficulty
    }
  end
end
