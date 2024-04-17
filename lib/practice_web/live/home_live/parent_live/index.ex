defmodule PracticeWeb.ParentLive.Index do
  use PracticeWeb, :live_view

  alias Phoenix.LiveView.JS
  import PracticeWeb.CustomComponents

  alias Practice.Schemas.User
  alias Practice.Repo

  def render(assigns) do
    ~H"""
    <.navbar />

    <div class="max-w-7xl mx-auto mt-20 text-gray-300 text-4xl items-center">
      <div class="grid grid-cols-2 justify-center items-center space-x-52">
        <div>
          <img src="images/icon_bg.png" class="h-auto w-full" />
        </div>

        <div class="space-y-10">
          <p>Parent Login</p>
          <.form phx-submit="login" class="space-y-6">
            <div class="space-y-2">
            <label for="name" class="text-2xl"> Enter your username </label>
              <input
                type="text"
                name="name"
                id="name"
                placeholder="Username"
                class="text-gray-800 w-full rounded-md"
              />
            </div>
            <div class="space-y-2">
            <label for="name" class="text-2xl"> Enter your password </label>

              <input
                type="password"
                name="password"
                id="password"
                placeholder="Password"
                class="text-gray-800 w-full rounded-md"
              />
            </div>
            <button class="rounded-md border px-6 py-2 text-xl hover hover:bg-blue-100 hover:text-black">
              Log in
            </button>
          </.form>


          <%!-- Display error message if present --%>
        </div>
      </div>
    </div>
    """
  end

  def handle_event(
        "login",
        %{"name" => name, "password" => password},
        socket
      ) do
    case authenticate_user(name, password) do
      {:ok, user} ->
        {:noreply, socket
        |> put_flash(:info, "Test")
        |> push_navigate(to: "/landingpage")
      }
      {:error} ->
        {:noreply, assign(socket, error: "Invalid Credentials")}
    end
  end

  defp authenticate_user(name, password) do
    case Repo.get_by(User, name: name) do
      nil ->
        :error

      user ->
        if user.password == password do
          {:ok, user}
        end
    end
  end
end
