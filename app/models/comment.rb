class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  paginates_per 10
end
