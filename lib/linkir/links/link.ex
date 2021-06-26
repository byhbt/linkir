defmodule Linkir.Links.Link do
  @moduledoc false

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
    |> cast(attrs, [:full_url, :short_url, :content])
    |> validate_required([:full_url, :short_url, :content])
  end

  @doc false
  def create_changeset(link, user, attrs) do
    link
    |> cast(attrs, [:full_url, :short_url, :content])
    |> validate_required([:full_url, :short_url, :content])
    |> put_change(:user_id, user.id)
    |> unique_constraint(:short_url, name: :links_short_url_index)
    |> unique_constraint(:full_url, name: :links_full_url_index)
  end
end
