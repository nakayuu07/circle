class Join < ActiveRecord::Base
  belongs_to :user
  belongs_to :collection
  has_many :notifications, dependent: :destroy
end
