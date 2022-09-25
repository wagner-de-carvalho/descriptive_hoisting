defmodule DescriptiveHoisting.MainModule do
  @moduledoc """
  MainModule
  """
  alias DescriptiveHoisting.MyProcessing

  @type kdr :: %{name: String.t(), kdr: float, game_id: String.t()}
  @type match :: %{kills: non_neg_integer(), deaths: non_neg_integer(), game_id: String.t()}
  @type player :: %{name: String.t(), match_history: list(match)}

  @spec deserialize_player_from_json_find_match_kdr(player) :: kdr
  def deserialize_player_from_json_find_match_kdr(player_json) do
    with {:ok, %{name: name, match_history: history}} <- Jason.deserialize(player_json) do
      history
      |> calculate_kdr_for_history()
      |> find_kdr_highest_game()
      |> serialize_to_kdr_with_name(name)
      |> MyProcessing.process()
    end
  end

  defp calculate_kdr_for_history(player_history) do
    Enum.map(player_history, fn %{kills: kills, deaths: deaths, game_id: game_id} ->
      {game_id, kills / deaths}
    end)
  end

  defp find_kdr_highest_game(game_ids_and_kdrs) do
    Enum.max_by(game_ids_and_kdrs, fn {_, kdr} -> kdr end)
  end

  defp serialize_to_kdr_with_name({game_id, kdr}, name) do
    %{name: name, kdr: game_id, game_id: kdr}
  end
end
