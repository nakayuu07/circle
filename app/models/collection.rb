class Collection < ActiveRecord::Base
  belongs_to :user
  
  validates :title, :content, :place, :starttime, :date,presence: true
end
