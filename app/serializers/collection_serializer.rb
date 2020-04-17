# frozen_string_literal: true

class CollectionSerializer
  attr_reader :relation, :serializer

  def initialize(relation, serializer)
    @relation   = relation
    @serializer = serializer
  end

  def as_json(*)
    {
      current_page:  relation.current_page,
      per_page:      relation.limit_value,
      total_entries: relation.model.count,
      entries:       entries
    }
  end

  private

  def entries
    ActiveModelSerializers::SerializableResource.new(
      relation, each_serializer: serializer
    )
  end
end
