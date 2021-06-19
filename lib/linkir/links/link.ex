defmodule Linkir.Links.Link do
  use Ecto.Schema

  import Ecto.Changeset

  schema "links" do
    field :click_count, :integer
    field :content, :string
    field :full_url, :string
    field :short_url, :string
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(link, attrs) do
    link
    |> cast(attrs, [:full_url, :short_url, :click_count, :content])
    |> validate_required([:full_url, :short_url, :click_count, :content])
  end
end
