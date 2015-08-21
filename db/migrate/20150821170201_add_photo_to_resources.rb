class AddPhotoToResources < ActiveRecord::Migration
  def change
    add_column :resources, :photo, :string
  end
end
