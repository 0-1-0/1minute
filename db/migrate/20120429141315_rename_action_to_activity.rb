class RenameActionToActivity < ActiveRecord::Migration
  def change
    rename_table :actions, :activities
  end
end
