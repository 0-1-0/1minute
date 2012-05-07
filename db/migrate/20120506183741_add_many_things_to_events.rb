class AddManyThingsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :conv_course, :float, default: 1.0
    add_column :events, :ex_name, :string
  end
end
