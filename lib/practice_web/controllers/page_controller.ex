defmodule PracticeWeb.PageController do
  use PracticeWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def users(conn, _params) do
    IO.puts("Users funcctions hit!")
    render(conn, :users, layout: false )

  end
end
