defmodule Practice.Context.Blogs do

  import Ecto.Query, warn: false
  alias Practice.Repo


  alias Practice.Schemas.Blogs


  def create_blogs(params, struct \\ %Blogs{}) do
    struct
    |> Blogs.create_blogs_changeset(params)

  end

  def insert_blogs(changeset) do
    changeset
    |> Repo.insert()
  end

  def register_blogs(attrs) do
    %Practice.Schemas.Blogs{}
    |> Blog.registration_changeset(attrs)
    |> Repo.insert()
  end

  def change_blog_registration(%Practice.Schemas.Blogs{} = blog, attrs \\ %{}) do
    Blogs.registration_changeset(blog, attrs, validate_email: false)
  end
end
