class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.integer :image_id
      t.integer :target_minimum
      t.integer :current_min
      t.float :current_money

      t.timestamps
    end
  end
end
