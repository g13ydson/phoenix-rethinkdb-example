defmodule PhoenixRethinkdbExampleWeb.MessageController do
  use PhoenixRethinkdbExampleWeb, :controller
  alias RethinkDatabase

  import RethinkDB.Query, only: [table: 2, table: 1, get_all: 3]

  def index(conn, _params) do
    {_, messages} =
      table("messages")
      |> RethinkDatabase.run()

    render(conn, "index.json", messages: messages)
  end

  def show(conn, %{"fractal_id" => fractal_id}) do
    {_, messages} =
      table("messages")
      |> get_all([fractal_id], index: "fractal_id")
      |> RethinkDatabase.run()

    render(conn, "show.json", messages: messages)
  end
end
