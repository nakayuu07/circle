class AddDateToCollection < ActiveRecord::Migration
  def change
    add_column :collections, :date, :date
  end
end
