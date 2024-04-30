defmodule Practice.Schemas.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :password, :string
    timestamps(type: :utc_datetime)
  end


  @spec changeset(
          {map(), map()}
          | %{
              :__struct__ => atom() | %{:__changeset__ => map(), optional(any()) => any()},
              optional(atom()) => any()
            }
        ) :: Ecto.Changeset.t()
  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:name, :password, :role])
    |> validate_required([:name, :password])

  end
end
