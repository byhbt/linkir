defmodule Linkir.Repo.Migrations.CreateLinks do
  use Ecto.Migration

  def change do
    create table(:links) do
      add :full_url, :string
      add :short_url, :string
      add :click_count, :integer
      add :content, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:links, [:user_id])
  end
end
