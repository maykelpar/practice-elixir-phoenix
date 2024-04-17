defmodule Practice.Context.User do

  alias Practice.Schemas.User
  alias Practice.Repo

 def create_user(params, struct \\ %User{}) do
  struct
  |> User.changeset(params)
 end


 def insert_user(changeset) do
  changeset
  |> Repo.insert()
 end


end
