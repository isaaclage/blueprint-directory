class AddIndexToResourcesEmail < ActiveRecord::Migration
  def change
    add_index :resources, :email, unique: true
  end
end
