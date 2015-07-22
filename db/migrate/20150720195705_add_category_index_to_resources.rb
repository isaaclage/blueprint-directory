class AddCategoryIndexToResources < ActiveRecord::Migration
  def change
    add_reference :resources, :category, index: true, foreign_key: true
  end
end
