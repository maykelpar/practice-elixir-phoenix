defmodule PracticeWeb.HomeLive.Index do
  alias Plug.Adapters.Test
  use PracticeWeb, :live_view

  use Phoenix.Component

  alias Phoenix.LiveView.JS
  import PracticeWeb.CustomComponents

  def render(assigns) do
    ~H"""
    <.navbar />

    <div class="max-w-7xl mx-auto mt-40 text-gray-300 text-4xl items-center h-screen">
      <div class="grid grid-cols-2 justify-center items-center space-x-52">
        <div class="space-y-6">
          <p class="text-8xl">Welcome</p>
          <p class="text-xl"> "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." </p>

        <div class="mt-36 space-x-6">
          <.link navigate="/parent-login" class="text-lg border rounded-lg px-6 py-2"> Guardian Login </.link>
          <.link navigate="/user" class="text-lg border rounded-lg px-6 py-2"> User Login </.link>

        </div>

        </div>

        <div class="space-y-6">
        <img src="images/medical.png" class="w-full h-auto"/>
        </div>


      </div>
    </div>
    """
  end
end
