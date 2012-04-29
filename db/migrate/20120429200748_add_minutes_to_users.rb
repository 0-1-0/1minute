class AddMinutesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :minutes, :integer, default: 0
  end
end
