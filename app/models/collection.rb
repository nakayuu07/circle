class Collection < ActiveRecord::Base
  belongs_to :user

  validates :title, :content, :place, :starttime, :date, :capacity, presence: true
end
