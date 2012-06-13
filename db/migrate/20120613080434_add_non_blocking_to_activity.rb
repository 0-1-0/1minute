class AddNonBlockingToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :non_blocking, :boolean, default: false
  end
end
