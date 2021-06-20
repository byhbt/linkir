defmodule Linkir.Repo.Migrations.CreateLinks do
  use Ecto.Migration

  def change do
    create table(:links) do
      add :full_url, :string
      add :short_url, :string
      add :click_count, :integer, default: 0
      add :content, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:links, [:user_id])
    create unique_index(:links, [:short_url], name: :links_short_url_index)
    create unique_index(:links, [:full_url], name: :links_full_url_index)
  end
end
