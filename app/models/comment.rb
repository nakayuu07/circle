class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :collection

  validates :content, presence: true
end
