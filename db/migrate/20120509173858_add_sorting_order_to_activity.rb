class AddSortingOrderToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :sorting_order, :integer,default: 0
  end
end
