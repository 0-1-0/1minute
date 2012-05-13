class AddConverNameToEvent < ActiveRecord::Migration
  def change
    add_column :events, :convert_name, :string
  end
end
