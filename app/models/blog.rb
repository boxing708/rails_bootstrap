class Blog < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 140 }
  belongs_to :user
  paginates_per 10
  scope :index_all, -> {
    select(:id, :title, :content, :user_id, :created_at) #フィールドごとにレコードを取得
    .order(created_at: :asc) #created_atカラムの昇順に並び替え
    .includes(:user) #ユーザを事前に取得してN+1防止
  }
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
