defmodule FlybraryApi.Repo.Migrations.CreateResource do
  use Ecto.Migration

  def change do
    create table(:resources) do
      add :title, :string
      add :description, :string
      add :topic, :string
      add :url, :string

      timestamps
    end

  end
end
