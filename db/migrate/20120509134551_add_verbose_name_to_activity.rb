class AddVerboseNameToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :verbose_name, :string
  end
end
