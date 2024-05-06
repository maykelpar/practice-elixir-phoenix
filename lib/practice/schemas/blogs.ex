defmodule Practice.Schemas.Blogs do
  use Ecto.Schema
  import Ecto.Changeset



  schema "blogs" do
    field :title, :string
    field :content, :string
    field :confirmed_at, :naive_datetime


    timestamps(type: :utc_datetime)
  end

  def create_blogs_changeset(blogs, params \\ %{}) do
    blogs
    |> cast(params, [:title, :content])

  end
end
