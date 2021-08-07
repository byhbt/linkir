# config/runtime.exs is executed for all environments, including
# during releases. It is executed after compilation and before the
# system starts, so it typically used load production configuration
# and secrets from environment variables or elsewhere. Do not define
# any compile-time configuration in here, as it won't be applied.
# The block below contains prod specific runtime configuration.

import Config

if config_env() == :prod do
  config :linkir, Linkir.Repo,
    ssl: false,
    url: System.fetch_env!("DATABASE_URL"),
    pool_size: String.to_integer(System.fetch_env!("DATABASE_POOL_SIZE")),
    disconnect_on_error_codes: [:read_only_sql_transaction]

  config :linkir, LinkirWeb.Endpoint,
    http: [
      port: String.to_integer(System.fetch_env!("PORT"))
    ],
    url: [host: System.fetch_env!("APP_URL"), port: System.fetch_env!("PORT")],
    cache_static_manifest: "priv/static/manifest.json",
    server: true,
    code_reloader: false,
    secret_key_base: System.fetch_env!("SECRET_KEY_BASE")
end
