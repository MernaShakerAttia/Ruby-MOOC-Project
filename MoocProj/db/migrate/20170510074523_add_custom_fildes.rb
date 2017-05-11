class AddCustomFildes < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :dob, :date
    add_column :users, :gender, :boolean
    add_column :users, :profile_pic, :string
  end
end
