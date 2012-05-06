class AddBigImageToEvents < ActiveRecord::Migration
  def change
    add_column :activities, :big_image, :string
  end
end
