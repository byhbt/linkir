defmodule Linkir.Features.FrontPageTest do
  use ExUnit.Case
  use Wallaby.Feature

  import Wallaby.Query

  feature "users can see the index page", %{session: session} do
    session
    |> visit("/")
    |> assert_has(css(".text-xl", text: "Linkir"))
  end
end
