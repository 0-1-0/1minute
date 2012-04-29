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

    add_index :transactions, :user_id
    add_index :transactions, :action_id
    add_index :transactions, :event_id
    add_index :transactions, :status
  end
end
