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
end
