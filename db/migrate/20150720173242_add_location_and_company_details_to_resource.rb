class AddLocationAndCompanyDetailsToResource < ActiveRecord::Migration
  def change
    add_column :resources, :position, :string
    add_column :resources, :location, :string
    add_column :resources, :company, :string
    add_column :resources, :website, :string
  end
end
