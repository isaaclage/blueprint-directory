class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :resource
  default_scope -> { order(created_at: :desc) }
 # validates :user_id, presence: true
  validates :resource_id, presence: true
  validates :content, presence: true
end
