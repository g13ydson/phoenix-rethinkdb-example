
# Phoenix Rethinkdb Example

  This is a very basic example of how to add RethinkDB to Phoenix >= 1.4 .
To start your Phoenix server:

* Install dependencies with `mix deps.get`

* Start Phoenix endpoint with `mix phx.server`

## API

CREATE a message
  [`POST localhost:4000/api/messages`](http://localhost:4000/api/messages)

      {
        "message": {
            "body": "Hello world",
            "fractal_id": "1"
        }
    }

LIST messages
  [`GET localhost:4000/api/messages`](http://localhost:4000/api/messages)
  
SHOW a message
  [`GET localhost:4000/api/messages/:fractal_id`](http://localhost:4000/api/messages/:fractal_id)
  
UPDATE a message
  [`PUT localhost:4000/api/messages/:fractal_id`](http://localhost:4000/api/messages/:fractal_id)

      {
        "message": {
            "body": "Update Hello world",
            "fractal_id": "1"
        }
    }

DELETE a message
  [`DELETE localhost:4000/api/messages/:fractal_id`](http://localhost:4000/api/messages/:fractal_id)