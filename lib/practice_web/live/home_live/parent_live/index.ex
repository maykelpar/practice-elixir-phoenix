defmodule PracticeWeb.ParentLive.Index do
  use PracticeWeb, :live_view


  use Phoenix.Component

  alias Phoenix.LiveView.JS
  import PracticeWeb.CustomComponents

  def render(assigns) do
    ~H"""

 <.navbar />


<div class="max-w-7xl mx-auto mt-20 text-gray-300 text-4xl items-center">
  <div class="grid grid-cols-2 justify-center items-center space-x-52">
    <div class="">
     <img src="images/icon_bg.png" class="h-auto w-full"/>
    </div>

    <div class="space-y-6">
     <p> Parent Log-In </p>
      <input type="text" id="username" name="username" placeholder="Username" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
      <input type="text" id="password" name="password" placeholder="Password" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">

      <button class="border rounded-md text-xl px-6 py-1"> Log in </button>
    </div>



  </div>
</div>
    """
  end
end
