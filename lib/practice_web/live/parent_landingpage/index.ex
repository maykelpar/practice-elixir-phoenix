defmodule PracticeWeb.LandingPageLive.Index do
  use PracticeWeb, :live_view

  use Phoenix.Component

  alias Practice.Context.Blogs

  alias Phoenix.LiveView.JS
  import PracticeWeb.CustomComponents

  def handle_params(params, _session, socket) do
    changeset = Practice.Context.Blogs.create_blogs(params)
    {:noreply, socket |> assign_form(changeset)}
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  def handle_event("validate", %{"blogs" => blogs_params} = params, socket) do
    changeset =
      blogs_params
      |> Blogs.create_blogs()
      |> IO.inspect(label: "validate")

    {:noreply,
     socket
     |> assign(:changeset, changeset)
     |> assign(:params, params)
     |> assign_form(changeset)}
  end

  def handle_event("save", %{"blogs" => blogs_params} = params, socket) do
    IO.inspect(params)
    changeset = socket.assigns.changeset

    if changeset.valid? do
      case Blogs.insert_blogs(changeset) do
        {:ok, _user} ->
          {:noreply,
           socket
           |> put_flash(:info, "Blogs Submitted Successfully!")
           |> push_navigate(to: "/landingpage")}

        {:error, _blogs} ->
          {:noreply, socket}
      end
    else
      {:noreply, socket}
    end
  end

  def render(assigns) do
    ~H"""
    <div class="max-w-7xl mx-auto flex flex-cols-2 space-between mt-20 text-gray-300 text-4xl items-center justify-between">
      <%!--
      <button
        phx-click={show_modal("add_blog")}
        class="text-gray-300 hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-sm font-medium"
      >
        Log Out
      </button> --%>

      <div class="items-center inline-block space-y-5">
        <img src="/images/leng.png" class="h-[100], w-96" />
        <p>Add Post</p>
      </div>

      <div class="items-center inline-block space-y-5">
        <img src="/images/kween.png" class="h-[100], w-72" />
        <p>View Posts</p>
      </div>
    </div>

    <.modal id="add_blog">
      <.simple_form
        for={@form}
        id="submit_blogs"
        phx-submit="save"
        phx-change="validate"
        class="bg-blue-500"
      >
        <%!-- <.error :if={@check_errors}>
            Oops, something went wrong! Please check the errors below.
          </.error> --%>

        <.input field={@form[:user_id]} type="hidden" value={@current_user.id} />
        <.input field={@form[:title]} type="text" label="Title" required />
        <.input field={@form[:content]} type="textarea" label="Content" required />

        <.button phx-submit="save" class="w-full">Save</.button>
      </.simple_form>
    </.modal>
    """
  end
end
