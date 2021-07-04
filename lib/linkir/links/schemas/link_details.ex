defmodule Linkir.Links.Schemas.LinkDetails do
  use Ecto.Schema

  alias Linkir.Links.Schemas.Link

  import Ecto.Changeset

  schema "link_details" do
    field :price, :integer
    field :raw_response, :string
    field :crawled_at, :naive_datetime

    belongs_to :link, Link

    timestamps()
  end

  @doc false
  def create_changeset(link_details \\ %__MODULE__{}, attrs) do
    link_details
    |> cast(attrs, [:price, :raw_response, :crawled_at, :link_id])
    |> validate_required([:price, :raw_response, :link_id, :crawled_at])
    |> assoc_constraint(:link)
  end
end
