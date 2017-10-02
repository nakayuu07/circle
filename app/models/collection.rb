class Collection < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, :content, :place, :starttime, :date, :capacity, presence: true
end
