class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.integer :action_id
      t.integer :event_id
      t.integer :minutes
      t.integer :money
      t.string :status

      t.timestamps
    end
  end
end
