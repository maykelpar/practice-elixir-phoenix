defmodule Practice.Practice.Parent do
  use Ecto.Schema
  import Ecto.Changeset

  schema "parent" do
     field :username, :string
    field :password_hash, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(parent, attrs) do
    parent
    |> cast(attrs, [])
    |> validate_required([])
  end
end
