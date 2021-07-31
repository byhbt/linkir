# config/runtime.exs is executed for all environments, including
# during releases. It is executed after compilation and before the
# system starts, so it typically used load production configuration
# and secrets from environment variables or elsewhere. Do not define
# any compile-time configuration in here, as it won't be applied.
# The block below contains prod specific runtime configuration.

import Config

if config_env() == :prod do
  config :linkir, Linkir.Repo,
    # ssl: true,
    url: System.fetch_env!("DATABASE_URL"),
    pool_size: String.to_integer(System.fetch_env!("DATABASE_POOL_SIZE"))

  config :linkir, LinkirWeb.Endpoint,
    http: [
      # Enable IPv6 and bind on all interfaces.
      # Set it to  {0, 0, 0, 0, 0, 0, 0, 1} for local network only access.
      # See the documentation on https://hexdocs.pm/plug_cowboy/Plug.Cowboy.html
      # for details about using IPv6 vs IPv4 and loopback vs public addresses.
      ip: {0, 0, 0, 0, 0, 0, 0, 0},
      port: String.to_integer(System.get_env("PORT") || "4000")
    ],
    secret_key_base: System.fetch_env!("SECRET_KEY_BASE")

end
