defmodule PhoenixRethinkdbExample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the endpoint when the application starts
      PhoenixRethinkdbExampleWeb.Endpoint,
      %{
        id: RethinkDatabase,
        start: {RethinkDatabase, :start_link, [[host: 'localhost', port: 28015]]}
      }
      # Starts a worker by calling: PhoenixRethinkdbExample.Worker.start_link(arg)
      # {PhoenixRethinkdbExample.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixRethinkdbExample.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PhoenixRethinkdbExampleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
