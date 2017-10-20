class AddUrlToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :url, :text
  end
end
