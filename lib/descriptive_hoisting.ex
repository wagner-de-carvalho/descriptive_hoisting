defmodule DescriptiveHoisting do
  @moduledoc """
  Documentation for `DescriptiveHoisting`.
  """
  defdelegate deserialize_player(player_json),
    to: DescriptiveHoisting.MainModule,
    as: deserialize_player_from_json_find_match_kdr
end
