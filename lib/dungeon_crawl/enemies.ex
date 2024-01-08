defmodule DungeonCrawl.Enemies do
  alias DungeonCrawl.Character

  def all(difficulty) do
    difficulty_rate = if difficulty == :hard, do: 1.25, else: 1

    [
      %Character{
        name: "Ogre",
        description: "A large creature. Big muscles. Angry and hungry.",
        hit_points: 12 * difficulty_rate,
        max_hit_points: 12 * difficulty_rate,
        damage_range: 3..5 |> Enum.map(&(&1 * difficulty_rate)),
        attack_description: "a hammer"
      },
      %Character{
        name: "Orc",
        description: "A green evil creature. Wears armor and an axe.",
        hit_points: 8 * difficulty_rate,
        max_hit_points: 8 * difficulty_rate,
        damage_range: 2..4 |> Enum.map(&(&1 * difficulty_rate)),
        attack_description: "an axe"
      },
      %Character{
        name: "Goblin",
        description: "A small green creature. Wears dirty clothes and a dagger.",
        hit_points: 4 * difficulty_rate,
        max_hit_points: 4 * difficulty_rate,
        damage_range: 1..2 |> Enum.map(&(&1 * difficulty_rate)),
        attack_description: "a dagger"
      }
    ]
  end
end
