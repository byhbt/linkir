defmodule Linkir.Links.Schemas.LinkDetails do
  use Ecto.Schema

  import Ecto.Changeset

  schema "link_details" do
    field :price, :float
    field :raw_response, :string
    field :crawled_at, :naive_datetime
    field :link_id, :integer

    timestamps()
  end

  @doc false
  def changeset(link_details \\ %__MODULE__{}, attrs) do
    link_details
    |> cast(attrs, [:price, :raw_response])
    |> validate_required([:price, :raw_response])
  end
end
