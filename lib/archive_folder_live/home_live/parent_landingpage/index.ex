defmodule PracticeWeb.LandingPageLive.Index do
  use PracticeWeb, :live_view

  use Phoenix.Component

  alias Phoenix.LiveView.JS
  import PracticeWeb.CustomComponents

  def render(assigns) do
  ~H"""

  <.navbar/>

  <div class="max-w-7xl mx-auto mt-20 text-gray-300 text-4xl items-center">
   <p> test </p>
  </div>
  """
  end
end
