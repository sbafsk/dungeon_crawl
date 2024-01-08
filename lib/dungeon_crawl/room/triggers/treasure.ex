defmodule DungeonCrawl.Room.Triggers.Treasure do
  alias DungeonCrawl.Room.Action
  alias Mix.Shell.IO, as: Shell

  @behaviour DungeonCrawl.Room.Trigger

  def run(character, %Action{id: :forward}, difficulty) do
    Shell.info("You're walking cautiosly and can see the next room.")
    {character, :forward, difficulty}
  end

  def run(character, %Action{id: :search}, difficulty) do
    healing = if difficulty == :easy, do: 6, else: 3
    Shell.info("You search the room looking for something useful.")
    Shell.info("You find a treasure box with a healing potion inside.")
    Shell.info("You drink the potion and resotre #{healing} hit points.")

    {
      DungeonCrawl.Character.heal(character, healing),
      :forward,
      difficulty
    }
  end
end
