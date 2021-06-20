defmodule Linkir.Links do
  @moduledoc """
  The Links context.
  """

  import Ecto.Query, warn: false

  alias Linkir.Repo
  alias Linkir.Links.Link
  alias Linkir.Accounts.User

  @doc """
  Returns the list of links.

  ## Examples

      iex> list_links()
      [%Link{}, ...]

  """
  def list_links do
    Link
    |> order_by(desc: :inserted_at)
    |> Repo.all()
  end

  @doc """
  Returns the list of links of specific user.

  ## Examples

      iex> list_links_by_user(user)
      [%Link{}, ...]

  """
  def list_links_by_user(user) do
    Link
    |> where([l], l.user_id == ^user.id)
    |> order_by(desc: :inserted_at)
    |> Repo.all()
  end

  @doc """
  Gets a single link.

  Raises `Ecto.NoResultsError` if the Link does not exist.

  ## Examples

      iex> get_link!(123)
      %Link{}

      iex> get_link!(456)
      ** (Ecto.NoResultsError)

  """
  def get_link!(id), do: Repo.get!(Link, id)

  @doc """
  Gets a single link.

  Raises `Ecto.NoResultsError` if the Link does not exist.

  ## Examples

      iex> get_link_by_uri!(123)
      %Link{}

      iex> get_link_by_uri!(456)
      ** (Ecto.NoResultsError)

  """
  def get_link_by_uri!(uri) do
    Link
    |> where(short_url: ^uri)
    |> Repo.one()
  end

  @doc """
  Creates a link.

  ## Examples

      iex> create_link(%{field: value})
      {:ok, %Link{}}

      iex> create_link(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_link(%User{} = user, attrs \\ %{}) do
    %Link{}
    |> Link.create_changeset(user, attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a link.

  ## Examples

      iex> update_link(link, %{field: new_value})
      {:ok, %Link{}}

      iex> update_link(link, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_link(%Link{} = link, attrs) do
    link
    |> Link.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a link.

  ## Examples

      iex> delete_link(link)
      {:ok, %Link{}}

      iex> delete_link(link)
      {:error, %Ecto.Changeset{}}

  """
  def delete_link(%Link{} = link) do
    Repo.delete(link)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking link changes.

  ## Examples

      iex> change_link(link)
      %Ecto.Changeset{data: %Link{}}

  """
  def change_link(%Link{} = link, attrs \\ %{}) do
    Link.changeset(link, attrs)
  end
end
