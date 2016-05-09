defmodule Rumbl.Repo do

  @moduledoc """
  In memory repository.
  """

  def all(Rumbl.User) do
    [
      %Rumbl.User{id: "1", name: "Jose", username: "josevalim", password: "elixir"},
      %Rumbl.User{id: "2", name: "Bruce", username: "redrapids", password: "7langs"},
      %Rumbl.User{id: "3", name: "Chris", username: "chrismccord", password: "phx"}
    ]
  end

  def all(_module), do: []

  def get(module, id) do
    Enum.find(
      all(module),
      fn i -> i.id == id end)
  end

  def get_by(module, params) do
    Enum.find(
      all(module),
      fn i -> Enum.all?(
        params,
        fn {k,v} -> Map.get(i,k) == v end)
      end)
  end

end
