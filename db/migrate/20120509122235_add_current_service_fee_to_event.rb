class AddCurrentServiceFeeToEvent < ActiveRecord::Migration
  def change
    add_column :events, :current_service_fee, :float, default: 0.0
  end
end
