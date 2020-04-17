class CreateFunctionHaversine < ActiveRecord::Migration[6.0]
  def up
    create_function :haversine
  end

  def down
    execute <<-SQL
      DROP FUNCTION IF EXISTS haversine
    SQL
  end
end
