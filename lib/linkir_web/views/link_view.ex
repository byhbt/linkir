defmodule LinkirWeb.LinkView do
  use LinkirWeb, :view

  alias Linkir.Links.Schemas.LinkDetails

  def money(%LinkDetails{} = link_details) do
    Money.Currency.vnd(link_details.price)
  end
end
