defmodule DungeonCrawl.Room.Trigger do
  alias DungeonCrawl.Character
  alias DungeonCrawl.Room.Action
  alias DungeonCrawl.GameSettings

  @callback run(Character.t(), Action.t(), GameSettings.t()) ::
              {Character.t(), atom, atom}
end
