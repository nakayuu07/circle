class AddCapacityToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :capacity, :integer
  end
end
