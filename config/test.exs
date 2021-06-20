use Mix.Config

# Only in tests, remove the complexity from the password hashing algorithm
config :bcrypt_elixir, :log_rounds, 1

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :linkir, Linkir.Repo,
  username: "postgres",
  password: "postgres",
  database: "linkir_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :linkir, LinkirWeb.Endpoint,
  http: [port: 4002],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

config :linkir, Linkir.Mailer, adapter: Bamboo.TestAdapter

# Dont run oban in tests
config :linkir, Oban, queues: false, plugins: false
config :wallaby, otp_app: :linkir
config :linkir, :sandbox, Ecto.Adapters.SQL.Sandbox
