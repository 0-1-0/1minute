class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.integer :image_id
      t.integer :target_minimum
      t.integer :current_min, default: 0
      t.float :current_money, default: 0

      t.timestamps
    end

    add_index :events, :name
  end
end
