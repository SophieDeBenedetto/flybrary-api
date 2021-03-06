defmodule FlybraryApi.ResourceTest do
  use FlybraryApi.ModelCase

  alias FlybraryApi.Resource

  @valid_attrs %{description: "some content", title: "some content", topic: "some content", url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Resource.changeset(%Resource{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Resource.changeset(%Resource{}, @invalid_attrs)
    refute changeset.valid?
  end
end
