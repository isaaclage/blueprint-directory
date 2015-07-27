class AddUserRefToComments < ActiveRecord::Migration
  def change
    add_column :comments, :user, :refernces
  end
end
