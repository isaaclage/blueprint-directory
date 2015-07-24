class Category < ActiveRecord::Base
  has_many :resources
  enum names: [ "Legal", "Accounting", "UI/UX Design", "Technology and Development", "Security and Compliance", "Venture Capital", "Industry", "Sales", "Marketing", "Human Resources" ]
end
