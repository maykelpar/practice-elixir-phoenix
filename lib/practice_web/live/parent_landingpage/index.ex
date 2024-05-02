defmodule PracticeWeb.LandingPageLive.Index do
  use PracticeWeb, :live_view

  use Phoenix.Component

  alias Phoenix.LiveView.JS
  import PracticeWeb.CustomComponents

  def render(assigns) do
  ~H"""


  <div class="max-w-7xl mx-auto mt-20 text-gray-300 text-4xl items-center">
   <p> Welcome, <%= @current_user.email %> </p>

   <div class="mx-auto max-w-sm">

      <.simple_form
        for={@form}
        id="register_blog"
        phx-submit="save"
        phx-change="validate"
        phx-trigger-action={@trigger_submit}
        action={~p"/users/log_in?_action=registered"}
        method="post"
        class = "bg-blue-500"
      >
        <.error :if={@check_errors}>
          Oops, something went wrong! Please check the errors below.
        </.error>

        <.input field={@form[:name_blog]} type="text" label="Write Your Blog" required />
        <.input field={@form[:desription]} type="text" label="Content" required />


      </.simple_form>
    </div>

  </div>

  """
  end
end


#   def mount(_params, _session, socket) do
#     changeset = Users.change_user_registration(%User{})

#     socket =
#       socket
#       |> assign(trigger_submit: false, check_errors: false)
#       |> assign_form(changeset)

#     {:ok, socket, temporary_assigns: [form: nil]}
#   end

#   def handle_event("save", %{"user" => user_params}, socket) do
#     case Users.register_user(user_params) do
#       {:ok, user} ->
#         {:ok, _} =
#           Users.deliver_user_confirmation_instructions(
#             user,
#             &url(~p"/users/confirm/#{&1}")
#           )

#         changeset = Users.change_user_registration(user)
#         {:noreply, socket |> assign(trigger_submit: true) |> assign_form(changeset)}

#       {:error, %Ecto.Changeset{} = changeset} ->
#         {:noreply, socket |> assign(check_errors: true) |> assign_form(changeset)}
#     end
#   end

#   def handle_event("validate", %{"user" => user_params}, socket) do
#     changeset = Users.change_user_registration(%User{}, user_params)
#     {:noreply, assign_form(socket, Map.put(changeset, :action, :validate))}
#   end

#   defp assign_form(socket, %Ecto.Changeset{} = changeset) do
#     form = to_form(changeset, as: "user")

#     if changeset.valid? do
#       assign(socket, form: form, check_errors: false)
#     else
#       assign(socket, form: form)
#     end
#   end
# end
