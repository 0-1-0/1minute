class FixBug < ActiveRecord::Migration
  def change
    rename_column :transactions, :action_id, :activity_id
  end
end
