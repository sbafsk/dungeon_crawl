defmodule DungeonCrawl.Room.Triggers.EnemyHidden do
  alias DungeonCrawl.Room.Action
  alias Mix.Shell.IO, as: Shell

  @behaviour DungeonCrawl.Room.Trigger

  def run(character, %Action{id: :forward}) do
    Shell.info("You're walking cautiosly and can see the next room.")
    {character, :forward}
  end

  def run(character, %Action{id: :rest}) do
    enemy = Enum.random(DungeonCrawl.Enemies.all())

    Shell.info("You search the room for a confortable place to rest.")
    Shell.info(" SUddenly...")
    Shell.info(enemy.description)
    Shell.info("The enemy #{enemy.name} surprices you and attacks first.")

    {_enemy, updated_char} = DungeonCrawl.Battle.fight(enemy, character)
    {updated_char, :forward}
  end
end
