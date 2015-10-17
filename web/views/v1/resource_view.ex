defmodule FlybraryApi.V1.ResourceView do
  use FlybraryApi.Web, :view

  def render("index.json", %{resources: resources}) do
    %{resource: render_many(resources, FlybraryApi.V1.ResourceView, "resource.json")}
  end

  def render("show.json", %{resource: resource}) do
    %{resource: render_one(resource, FlybraryApi.V1.ResourceView, "resource.json")}
  end

  def render("resource.json", %{resource: resource}) do
    %{id: resource.id,
      title: resource.title,
      description: resource.description,
      topic: resource.topic,
      url: resource.url}
  end
end
