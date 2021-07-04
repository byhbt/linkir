defmodule Linkir.Repo.Migrations.CreateLinkDetails do
  use Ecto.Migration

  def change do
    create table(:link_details) do
      add :price, :integer
      add :raw_response, :text
      add :crawled_at, :naive_datetime
      add :link_id, references(:links, on_delete: :nothing)

      timestamps()
    end

    create index(:link_details, [:link_id])
  end
end
