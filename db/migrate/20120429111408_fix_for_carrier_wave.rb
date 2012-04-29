class FixForCarrierWave < ActiveRecord::Migration
  def change
    rename_column :events, :image_id, :image
    rename_column :actions, :image_id, :image

    change_column :events,  :image, :string
    change_column :actions, :image, :string
  end
end
