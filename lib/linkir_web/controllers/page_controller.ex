defmodule LinkirWeb.PageController do
  use LinkirWeb, :controller

  alias Linkir.Accounts
  alias Linkir.Accounts.User
  alias LinkirWeb.UserAuth

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
