class RemoveVerboseNameFromActivity < ActiveRecord::Migration
  def up
    remove_column :activities, :verbose_name
      end

  def down
    add_column :activities, :verbose_name, :string
  end
end
