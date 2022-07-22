class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_one_attached :icon
  has_many :blogs, dependent: :destroy
  has_many :comments
  paginates_per 10
  scope :index_all, -> {
    select(:id, :name, :email) #フィールドごとにレコードを取得
    .with_attached_icon #iconを事前に取得してN+1防止
  }
  # Favorite
  has_many :favorites, dependent: :destroy
  has_many :favorite_blogs, through: :favorites, source: :blog
  # Relationship
  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed

  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
end
