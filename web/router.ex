defmodule FlybraryApi.Router do
  use FlybraryApi.Web, :router

  pipeline :api do
    plug CORSPlug, [origin: "*"]
    plug :accepts, ["json"]
  end

  scope "/", FlybraryApi do
    pipe_through :api

    scope "/v1", V1, as: :v1 do
      resources "/resources", ResourceController
      options "/resources*anything", ResourceController, :options
    end
  end
end
