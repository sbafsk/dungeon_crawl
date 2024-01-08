defmodule DungeonCrawl.GameSettings do
  @type t :: %DungeonCrawl.GameSettings{difficulty: atom}

  defstruct difficulty: :easy
end
