class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|

      t.string :title
      t.text :content
      t.text :place

      t.timestamps null: false
    end
  end
end
