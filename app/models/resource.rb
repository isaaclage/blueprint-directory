class Resource < ActiveRecord::Base
  enum names: [ "Legal", "Accounting", "UI/UX Design", "Technology and Development", "Security and Compliance", "Venture Capital", "Industry", "Sales", "Marketing", "Human Resources" ]
  has_many :comments, dependent: :destroy
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #Is this the best email regex to use? Doesn't stop ..
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :category_id, presence: true
end
