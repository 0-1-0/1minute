class AddSortingOrderToEvent < ActiveRecord::Migration
  def change
    add_column :events, :sorting_order, :integer,default:0
  end
end
