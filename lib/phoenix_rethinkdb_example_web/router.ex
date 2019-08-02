defmodule PhoenixRethinkdbExampleWeb.Router do
  use PhoenixRethinkdbExampleWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PhoenixRethinkdbExampleWeb do
    pipe_through :api
    resources "/messages", MessageController, except: [:new, :edit], param: "fractal_id"
  end
end
