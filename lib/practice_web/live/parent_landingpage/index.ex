defmodule PracticeWeb.LandingPageLive.Index do
  use PracticeWeb, :live_view

  use Phoenix.Component


  alias Practice.Context.Blogs


  alias Phoenix.LiveView.JS
  import PracticeWeb.CustomComponents


  def handle_params(params, _session, socket) do
    changeset = Blogs.create_blogs(params)
    {:noreply, socket |> assign_form(changeset)}
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
  assign(socket, :form, to_form(changeset))
  end

  def handle_event("validate", %{"blogs" => blog_params}, socket) do
     changeset = Blogs.change_blog_registration(%Blog{}, blog_params)
     {:noreply, assign_form(socket, Map.put(changeset, :action, :validate))}

    end




  def render(assigns) do
  ~H"""


  <div class="max-w-7xl mx-auto mt-20 text-gray-300 text-4xl items-center">
   <p> Welcome, <%= @current_user.email %> </p>

   <.simple_form
        for={@form}
        id="submit_blogs"
        phx-submit="save"
        phx-change="validate"
        class = "bg-blue-500"
      >
        <%!-- <.error :if={@check_errors}>
          Oops, something went wrong! Please check the errors below.
        </.error> --%>

        <.input field={@form[:title]} type="text" label="Email" required />
        <.input field={@form[:content]} type="textarea" label="Password" required />


        <:actions>
          <.button phx-disable-with="Creating account..." class="w-full">Create an account</.button>
        </:actions>
      </.simple_form>



  </div>

  """
  end
end
