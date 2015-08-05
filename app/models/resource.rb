class Resource < ActiveRecord::Base
  enum names: [ "Legal", "Accounting", "Sales", "Marketing", "Human Resources", "Venture Capital", "Industry Leads", "Security and Compliance", "UI and UX Design", "Technology Development" ]
  has_many :comments, dependent: :destroy
  belongs_to :user
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #Is this the best email regex to use? Doesn't stop ..
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :category_id, presence: true
end
