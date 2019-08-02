defmodule PhoenixRethinkdbExampleWeb.Router do
  use PhoenixRethinkdbExampleWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PhoenixRethinkdbExampleWeb do
    pipe_through :api
    resources "/messages", MessageController, only: [:index, :show], param: "fractal_id"
  end
end
