class AddNameAndIdToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :name, :string
    add_column :categories, :category_id, :integer
  end
end
