defmodule FlybraryApi.Resource do
  use FlybraryApi.Web, :model

  schema "resources" do
    field :title, :string
    field :description, :string
    field :topic, :string
    field :url, :string

    timestamps
  end

  @required_fields ~w(title description topic url)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
