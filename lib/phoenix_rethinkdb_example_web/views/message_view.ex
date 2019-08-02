defmodule PhoenixRethinkdbExampleWeb.MessageView do
  use PhoenixRethinkdbExampleWeb, :view
  alias PhoenixRethinkdbExampleWeb.MessageView

  def render("index.json", %{messages: messages}) do
    %{data: render_many(messages, MessageView, "message.json")}
  end

  def render("show.json", %{messages: messages}) do
    %{data: render_many(messages, MessageView, "message.json")}
  end

  def render("message.json", %{message: message}) do
    %{
      id: message["id"],
      fractal_id: message["fractal_id"],
      body: message["body"]
    }
  end
end
