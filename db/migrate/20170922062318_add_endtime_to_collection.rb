class AddEndtimeToCollection < ActiveRecord::Migration
  def change
    add_column :collections, :endtime, :string
  end
end
