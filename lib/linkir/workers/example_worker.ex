defmodule Linkir.Workers.GetPriceWorker do
  @moduledoc false

  use Oban.Worker

  @impl Oban.Worker
  def perform(_job) do
    # Perform some work and then return :ok
    IO.puts "Let crawl some data"
    :ok
  end
end

