class Collection < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :joins, dependent: :destroy
  has_many :join_users,through: :joins,source: :user

  validates :title, :content, :place, :starttime, :date, :capacity, presence: true

  mount_uploader :picture, ImageUploader

  def self.search(search) #self.でクラスメソッドとしている
    if search
       # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Collection.where(['title LIKE ?',"%#{search}%"])
    else
      Collection.all #全て表示。
    end
  end
end
