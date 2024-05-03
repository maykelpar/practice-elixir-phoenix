defmodule Practice.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :title, :string
    field :content, :string
    field :confirmed_at, :naive_datetime


    timestamps(type: :utc_datetime)
  end
end
