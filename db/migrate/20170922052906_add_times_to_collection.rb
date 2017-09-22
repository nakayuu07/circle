class AddTimesToCollection < ActiveRecord::Migration
  def change
    add_column :collections, :starttime, :string
  end
end
