defmodule PracticeWeb.CustomComponents do
  use Phoenix.Component

  alias Phoenix.LiveView.JS
  import PracticeWeb.CoreComponents

  def navbar(assigns) do
    ~H"""
    <nav class="bg-gray-800 border-b-4 border-sky-800">
      <div class="mx-auto max-w-7xl">
        <div class="relative flex h-16 items-center">
          <%!-- <div class="absolute inset-y-0 left-0 flex items-center sm:hidden"> --%>
          <!-- Mobile menu button-->
          <%!-- <button type="button" class="relative inline-flex items-center justify-center rounded-md p-2 text-gray-400 hover:bg-gray-700 hover:text-white focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white" aria-controls="mobile-menu" aria-expanded="false">
          <span class="absolute -inset-0.5"></span>
          <span class="sr-only">Open main menu</span>
          <!--
            Icon when menu is closed.

            Menu open: "hidden", Menu closed: "block"
          -->
          <svg class="block h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
            <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
          </svg>
          <!--
            Icon when menu is open.

            Menu open: "block", Menu closed: "hidden"
          -->
          <svg class="hidden h-6 w-6" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
            <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
          </svg>
        </button> --%>
          <%!-- </div> --%>
          <div class="max-w-7xl mx-auto flex flex-1 items-center justify-between">
            <div class="flex flex-shrink-0 items-center">
              <img
                class="h-20 w-auto"
                src="images/par.png"
                alt="Your Company"
              />
            </div>
            <div class="hidden sm:ml-6 sm:block">
              <div class="flex space-x-4">
                <!-- Current: "bg-gray-900 text-white", Default: "text-gray-300 hover:bg-gray-700 hover:text-white" -->
                <.link
                 navigate="/"
                  class="text-gray-300 hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-sm font-mediums"
                >
                  Home
                </.link>
                <.link
                  navigate="/about-us"
                  class="text-gray-300 hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-sm font-medium"
                >
                  About Me
                </.link>
                <a
                  href="#"
                  class="text-gray-300 hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-sm font-medium"
                >
                  Contact
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Mobile menu, show/hide based on menu state. -->
    </nav>
    """
  end
end