defmodule Practice.Repo.Migrations.CreateParent do
  use Ecto.Migration

  def change do
    create table(:parent) do

      timestamps(type: :utc_datetime)
    end
  end
end
