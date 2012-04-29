class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string :type
      t.text :description
      t.string :data
      t.integer :minutes
      t.float :money
      t.integer :image_id
      t.boolean :instantly, default: false

      t.timestamps
    end

    add_index :actions, :type
  end
end
