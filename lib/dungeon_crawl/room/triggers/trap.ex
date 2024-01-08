defmodule DungeonCrawl.Room.Triggers.Trap do
  alias DungeonCrawl.Room.Action
  alias Mix.Shell.IO, as: Shell

  @behaviour DungeonCrawl.Room.Trigger

  def run(character, %Action{id: :forward}, difficulty) do
    Shell.info("You're walking cautiosly and can see the next room.")
    {character, :forward, difficulty}
  end

  def run(character, %Action{id: :search}, difficulty) do
    damage = if difficulty == :easy, do: 2, else: 4

    Shell.info("You search the room looking for something useful.")
    Shell.info("You step on a false floor and fall into a trap.")
    Shell.info("You are hit by an arrow, losing #{damage} hit points.")

    {
      DungeonCrawl.Character.take_damage(character, damage),
      :forward,
      difficulty
    }
  end
end
