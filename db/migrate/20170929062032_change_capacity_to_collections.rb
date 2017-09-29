class ChangeCapacityToCollections < ActiveRecord::Migration
 def up
     change_column :collections, :capacity, :string
 end

 def down
    add_column :collections, :capacity, :integer
 end
end
