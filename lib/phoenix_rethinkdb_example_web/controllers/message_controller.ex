defmodule PhoenixRethinkdbExampleWeb.MessageController do
  use PhoenixRethinkdbExampleWeb, :controller
  alias RethinkDatabase
  alias RethinkDB.Query

  import RethinkDB.Query, only: [table: 2, table: 1, get_all: 3, insert: 2, filter: 2, delete: 1]

  def create(conn, %{"message" => message_params}) do
    query =
      table("messages")
      |> insert(message_params)

    with {:ok, message} <- RethinkDatabase.run(query) do
      json(conn, message.data)
    end
  end

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

  def update(conn, %{"fractal_id" => fractal_id, "message" => message_params}) do
    query =
      table("messages")
      |> filter(%{fractal_id: fractal_id})
      |> Query.update(message_params)

    with {:ok, message} <- RethinkDatabase.run(query) do
      json(conn, message.data)
    end
  end

  def delete(conn, %{"fractal_id" => fractal_id}) do
    query =
      table("messages")
      |> filter(%{fractal_id: fractal_id})
      |> delete

    with {:ok, message} <- RethinkDatabase.run(query) do
      json(conn, message.data)
    end
  end
end
