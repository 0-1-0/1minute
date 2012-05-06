class AddLogoImageToEvents < ActiveRecord::Migration
  def change
    add_column :activities, :logo_image, :string
  end
end
