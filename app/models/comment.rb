class Comment < ActiveRecord::Base
  belongs_to :resource
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :resource_id, presence: true
  validates :user_id, presence: true
  validates :content, presence: true
  validates :rating, presence: true
end
