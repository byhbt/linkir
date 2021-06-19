defmodule Linkir.Repo do
  use Ecto.Repo,
    otp_app: :linkir,
    adapter: Ecto.Adapters.Postgres
end
