class Collection < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :joins, dependent: :destroy
  has_many :join_users,through: :joins,source: :user

  validates :title, :content, :place, :starttime, :date, :capacity, presence: true
end
