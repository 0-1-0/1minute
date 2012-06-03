class AddVisibleToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :visible, :boolean, :null => false, :default => true
  end
end
