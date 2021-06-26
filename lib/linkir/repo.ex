defmodule Linkir.Repo do
  @moduledoc false

  use Ecto.Repo,
    otp_app: :linkir,
    adapter: Ecto.Adapters.Postgres
end
