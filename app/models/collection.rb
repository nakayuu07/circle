class Collection < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :joins, dependent: :destroy
  has_many :join_users,through: :joins,source: :user
  has_many :keeps, dependent: :destroy
  has_many :keeps_users, through: :keeps, source: :user

  validates :title, :content, :place, :starttime, :date, :capacity, presence: true
  validates :capacity, numericality: { only_integer: true }

  mount_uploader :picture, ImageUploader

  def timeover?
    if date < Date.today
      return true
    else
      false
    end
  end

  def self.search(search)
    if search
      where('title LIKE ?',"%#{search}%").where('date > ?', Date.today)
    else
      all.order(:date).where('date >= ?', Date.today)
    end
  end

  def self.set_flash_message(params_search)
    if search(params_search).empty?
      "イベントはありません"
    else
      nil
    end
  end

end
