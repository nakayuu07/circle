class Collection < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :joins, dependent: :destroy
  has_many :join_users,through: :joins,source: :user

  validates :title, :content, :place, :starttime, :date, :capacity, presence: true

  validates :capacity, numericality: { only_integer: true }

  mount_uploader :picture, ImageUploader

  def self.search(search)
    if search
      Collection.where(['title LIKE ?',"%#{search}%"])
    else
      Collection.all
    end
  end
end

#   def self.event_join(collection)
#     join = collection.joins
#     if join && collection.joins.count == collection.capacity.to_i && collection.user != @user
#       return true
#     end
#     return false
#   end
# end
