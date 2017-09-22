class Collection < ActiveRecord::Base
  validates :title, :content, :place, :starttime, :date,presence: true
end
