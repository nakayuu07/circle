class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :collection
  has_many :notifications, dependent: :destroy

  validates :content, presence: true
end
