class Collection < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :joins, dependent: :destroy
  has_many :join_users,through: :joins,source: :user

  validates :title, :content, :place, :starttime, :date, :capacity, presence: true

  validates :capacity, numericality: { only_integer: true }

  # validates :starttime, :endtime, numericality: { only_integer:  true }

  mount_uploader :picture, ImageUploader

  def self.search(search)
    if search
      Collection.where(['title LIKE ?',"%#{search}%"])
    else
      Collection.all
    end
  end
end
