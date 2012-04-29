class FixTransaction < ActiveRecord::Migration
  def change
    change_column :transactions, :money, :float
  end
end
