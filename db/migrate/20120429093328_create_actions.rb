class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string :type
      t.text :description
      t.string :data
      t.integer :minutes
      t.float :money
      t.integer :image_id
      t.boolean :instantly

      t.timestamps
    end
  end
end
