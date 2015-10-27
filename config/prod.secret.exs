use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :flybrary_api, FlybraryApi.Endpoint,
  secret_key_base: System.get_env("SECRET_KEY_BASE")




config :flybrary_api, FlybraryApi.Repo, 
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL") || 
  "ecto://postgres:postgres@localhost/flybrary_api_prod",
  size: 20