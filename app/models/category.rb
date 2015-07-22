class Category < ActiveRecord::Base
  has_many :resources
  enum names: [ "UI/UX Design", "Tech and Development", "Industry", "Security and Compliance", "Talent and HR", "Venture Capital" ]
end
