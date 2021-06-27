defmodule LinkirWeb.PageController do
  @moduledoc """
  The Page controller.

  For handling render some static pages of the project.
  """

  use LinkirWeb, :controller

  def index(conn, _params), do: render(conn, "index.html")
end
