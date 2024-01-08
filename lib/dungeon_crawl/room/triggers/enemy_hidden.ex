defmodule DungeonCrawl.Room.Triggers.EnemyHidden do
  alias DungeonCrawl.Room.Action
  alias Mix.Shell.IO, as: Shell

  @behaviour DungeonCrawl.Room.Trigger

  def run(character, %Action{id: :forward}, difficulty) do
    Shell.info("You're walking cautiosly and can see the next room.")
    {character, :forward, difficulty}
  end

  def run(character, %Action{id: :rest}, difficulty) do
    enemy = Enum.random(DungeonCrawl.Enemies.all(difficulty))

    Shell.info("You search the room for a confortable place to rest.")
    Shell.info("Suddenly...")
    Shell.info(enemy.description)
    Shell.info("The enemy #{enemy.name} surprices you and attacks first.")

    {_enemy, updated_char} = DungeonCrawl.Battle.fight(enemy, character)
    {updated_char, :forward, difficulty}
  end
end
