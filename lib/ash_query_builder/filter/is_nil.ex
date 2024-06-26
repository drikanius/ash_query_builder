defmodule AshQueryBuilder.Filter.IsNil do
  @moduledoc false

  use AshQueryBuilder.Filter, operator: :is_nil

  @impl true
  def new(id, path, field, _, opts) do
    enabled? = Keyword.get(opts, :enabled?, true)
    metadata = Keyword.get(opts, :metadata)

    struct(__MODULE__, id: id, field: field, path: path, enabled?: enabled?, metadata: metadata)
  end
end

defimpl AshQueryBuilder.Filter.Protocol, for: AshQueryBuilder.Filter.IsNil do
  use AshQueryBuilder.Filter.QueryHelpers

  def to_expression(filter), do: expr(is_nil(make_ref(^filter)))

  def operator(_), do: AshQueryBuilder.Filter.IsNil.operator()
end
