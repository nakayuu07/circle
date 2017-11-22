class AddJoinIdToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :join_id, :integer
  end
end
