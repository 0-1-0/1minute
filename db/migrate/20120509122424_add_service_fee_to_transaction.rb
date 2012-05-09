class AddServiceFeeToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :service_fee, :float, default: 0.0
  end
end
