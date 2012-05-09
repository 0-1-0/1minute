class AddServiceFeeToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :service_fee, :float, default: 0.0
  end
end
