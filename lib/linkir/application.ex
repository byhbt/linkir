defmodule Linkir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Linkir.Repo,
      # Start the Telemetry supervisor
      LinkirWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Linkir.PubSub},
      # Start the Endpoint (http/https)
      LinkirWeb.Endpoint,
      # Start a worker by calling: Linkir.Worker.start_link(arg)
      # {Linkir.Worker, arg}
      {Oban, oban_config()}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Linkir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    LinkirWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  # Add this line
  defp oban_config do
    Application.fetch_env!(:linkir, Oban)
  end
end
