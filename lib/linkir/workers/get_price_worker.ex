defmodule Linkir.Workers.GetPriceWorker do
  @moduledoc false

  use Oban.Worker

  alias Linkir.Links

  @impl Oban.Worker
  def perform(%Oban.Job{args: %{"link_id" => link_id} = _args}) do
    link = Links.get_link!(link_id)

    IO.puts("Crawling: " <> link.full_url)

    :ok
  end
end
