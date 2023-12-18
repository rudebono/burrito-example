defmodule BurritoExample.Worker do
  use GenServer

  require Logger

  @loop 1_000

  def start_link(_args) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  @impl true
  def init(_) do
    {:ok, [], {:continue, :loop}}
  end

  @impl true
  def handle_continue(:loop, state) do
    ping()
    {:noreply, state}
  end

  @impl true
  def handle_info(:ping, state) do
    Logger.info("pong")
    ping()
    {:noreply, state}
  end

  def ping() do
    Process.send_after(__MODULE__, :ping, @loop)
  end
end
