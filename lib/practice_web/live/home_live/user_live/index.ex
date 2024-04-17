defmodule PracticeWeb.UserLive.Index do
  use PracticeWeb, :live_view

  use Phoenix.Component

  alias Practice.Context.User
  alias Practice.Repo

  alias Phoenix.LiveView.JS
  import PracticeWeb.CustomComponents


  # def mount(_params, _session, socket) do
  #   form = %{
  #     "name" => "",
  #    "password" => ""
  # }
  #   {:ok, assign(socket, form: form)}
  # end

  def handle_params(params, _session, socket) do
    changeset = Practice.Context.User.create_user(params)
    {:noreply, socket |> assign_form(changeset)}
  end

defp assign_form(socket, %Ecto.Changeset{} = changeset) do
  assign(socket, :form, to_form(changeset))
end


  def render(assigns) do
    IO.inspect(assigns.form)

    ~H"""

    <.navbar />

    <div class="max-w-7xl mx-auto mt-20 text-gray-300 text-4xl items-center">
      <div class="grid grid-cols-2 justify-center items-center space-x-52">
        <div>
          <img src="images/groupuser.png" class="h-auto w-auto" />
        </div>

        <div class="space-y-10">
          <p>Create User Login</p>

          <.form for={@form} phx-submit="save" phx-change="validate" class="space-y-6">
            <label for="name" class="text-2xl"> Create Username</label>
            <.input
            type="text"
            placeholder="Enter your username"
            field={@form[:name]}/>

            <label for="name" class="text-2xl">Create Password</label>
            <.input
            type="password"
            placeholder="Enter your password"
            field={@form[:password]}/>

            <button class="rounded-md border px-6 py-2 text-xl hover hover:bg-blue-100 hover:text-black">Save User</button>
          </.form>


        </div>
      </div>
    </div>
    """
  end

  def handle_event("save", %{"user" => user_params} = params, socket) do
    IO.inspect(params)
    changeset = socket.assigns.changeset
    if changeset.valid? do

      case User.insert_user(changeset) do
        {:ok, _user} ->
          {:noreply, socket
          |> put_flash(:info, "Registration Successful! Login")
          |> push_navigate(to: "/parent-login")
        }
        {:error, _user} ->
          {:noreply, socket}
      end
    else
      {:noreply, socket}
    end
  end

  def handle_event("validate", %{"user" => user_params} = params, socket) do
    changeset =
    user_params
      |> User.create_user()
      |> IO.inspect(label: "validate")

    {:noreply,
      socket
      |> assign(:changeset, changeset)
      |> assign(:params, params)
      |> assign_form(changeset)
  }
  end

  def handle_event("toggle_modal", _, socket) do
    current_visibility = socket.assigns.visible
    new_visibility = !current_visibility
    {:noreply, assign(socket, visible: new_visibility)}
  end

end
  # def handle_event("save", %{"name" => name, "password" => password}, socket) do
  #   changeset = User.changeset(%User{}, %{"name" => name, "password" => password})

  #   IO.inspect(changeset)  # Optional for debugging
  #   case Repo.insert(changeset) do
  #     {:ok, user} ->
  #       IO.inspect user  # Optional for debugging
  #       # Redirect to dashboard on successful registration
  #       {:noreply, redirect(socket, to: "/")}
  #     {:error, changeset} ->
  #       # Display errors if registration fails
  #       {:noreply, assign(socket, :changeset, changeset)}
  #   end
  # end
