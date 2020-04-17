class CollectionSerializer
  attr_reader :relation, :serializer

  def initialize(relation, serializer)
    @relation   = relation
    @serializer = serializer
  end

  def as_json(*args)
    {
      current_page:  relation.current_page,
      per_page:      relation.limit_value,
      total_entries: relation.model.count,
      entries:       entries
    }
  end

  private

  def entries
    ActiveModel::SerializableResource.new(relation, each_serializer: serializer)
  end
end
