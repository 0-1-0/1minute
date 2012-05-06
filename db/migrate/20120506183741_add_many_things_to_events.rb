class AddManyThingsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :conv_course, :float
    add_column :events, :ex_name, :string
  end
end
