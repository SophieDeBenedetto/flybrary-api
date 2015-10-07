defmodule FlybraryApi.V1.ResourceControllerTest do
  use FlybraryApi.ConnCase

  alias FlybraryApi.Resource
  @valid_attrs %{description: "some content", title: "some content", topic: "some content", url: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, v1_resource_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    resource = Repo.insert! %Resource{}
    conn = get conn, v1_resource_path(conn, :show, resource)
    assert json_response(conn, 200)["data"] == %{"id" => resource.id,
      "title" => resource.title,
      "description" => resource.description,
      "topic" => resource.topic,
      "url" => resource.url}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, v1_resource_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, v1_resource_path(conn, :create), resource: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Resource, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, v1_resource_path(conn, :create), resource: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    resource = Repo.insert! %Resource{}
    conn = put conn, v1_resource_path(conn, :update, resource), resource: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Resource, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    resource = Repo.insert! %Resource{}
    conn = put conn, v1_resource_path(conn, :update, resource), resource: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    resource = Repo.insert! %Resource{}
    conn = delete conn, v1_resource_path(conn, :delete, resource)
    assert response(conn, 204)
    refute Repo.get(Resource, resource.id)
  end
end
