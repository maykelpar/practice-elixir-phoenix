defmodule Practice.Repo.Migrations.UpdateBlogs do
  use Ecto.Migration

  def change do

    create table(:blogs) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :title, :string, null: false
      add :content, :string, null: false
      add :confirmed_at, :naive_datetime
      timestamps(type: :utc_datetime)
    end
    create unique_index(:blogs, [:title])
    create index(:blogs, [:user_id])

  end
end
