defmodule DescriptiveHoisting do
  @moduledoc """
  Documentation for `DescriptiveHoisting`.
  """
  @type kdr :: %{name: String.t(), kdr: float}
  @type match :: %{kills: non_neg_integer(), deaths: non_neg_integer()}
  @type player :: %{name: String.t(), match_history: list(match)}


  @spec deserialize_player_from_json_find_match_kdr(player) :: kdr
  def deserialize_player_from_json_find_match_kdr(player_json) do
    Jason.deserialize(player_json)

  end
end
