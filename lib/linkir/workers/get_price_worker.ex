defmodule Linkir.Workers.GetPriceWorker do
  @moduledoc false

  use Oban.Worker

  alias Linkir.Links

  @impl Oban.Worker
  def perform(%Oban.Job{args: %{"link_id" => link_id}}) do
    link = Links.get_link!(link_id)

    {:ok, response} = Links.crawl(link.full_url)
    {:ok, price, json_response} = Links.get_price(response.body)

    crawled_data = %{
      price: price,
      raw_response: json_response,
      crawled_at: NaiveDateTime.utc_now(),
      link_id: link.id
    }

    res = Links.add_crawl_result(link, crawled_data)
  end
end
