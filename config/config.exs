# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :linkir, ecto_repos: [Linkir.Repo], generators: [binary_id: true]

# Configures the endpoint
config :linkir, LinkirWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "gezCztOVJKD3K7/pRxOCsVz2/26KpvIXP6iwcLAtR6kikK55jKMTPDbjxLrheGDc",
  render_errors: [view: LinkirWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Linkir.PubSub,
  live_view: [signing_salt: "ywIHqVZp"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :linkir, Linkir.Mailer,
  adapter: Bamboo.MandrillAdapter,
  api_key: "my_api_key"

config :linkir, Oban,
  repo: Linkir.Repo,
  queues: [default: 10, mailers: 20, events: 50, low: 5],
  plugins: [
    Oban.Plugins.Pruner,
    {
      Oban.Plugins.Cron,
     crontab: [
       {"* * * * *", Linkir.Workers.GetPriceWorker},
     ]
    }
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
