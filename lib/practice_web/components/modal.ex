defmodule PracticeWeb.LogoutModal do
  use PracticeWeb, :live_component

  def mount(socket, _assigns) do
    socket = assign(socket, visible: false)
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div phx-modal="id: logout-modal" show={@visible}>
      <p>Are you sure you want to log out?</p>
      <button type="button" phx-click="close" class="btn btn-secondary">No</button>
      <button type="button" phx-click="logout" class="btn btn-primary">Yes</button>
    </div>
    """
  end

  def handle_event("close", _, socket) do
    socket = assign(socket, visible: false)
    {:noreply, socket}
  end

  def handle_event("logout", _, socket) do
    Phoenix.Session.configure_session(socket, drop: true)
    {:noreply, socket}
  end
end
