defmodule BurritoExample.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      BurritoExample.Worker
    ]

    opts = [strategy: :one_for_one, name: BurritoExample.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
