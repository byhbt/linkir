defmodule LinkirWeb.ShortUrlController do
  use LinkirWeb, :controller

  alias Linkir.Accounts
  alias Linkir.Links
  alias Linkir.Links.Link
  alias Linkir.Accounts.User
  alias LinkirWeb.UserAuth

  def show(conn, %{"short_uri" => short_uri}) do
    case Links.get_link_by_uri!(short_uri) do
      nil -> IO.puts "Not found"
      %Link{full_url: full_url} ->
        conn
        |> put_status(301)
        |> redirect(external: full_url)
    end
  end
end