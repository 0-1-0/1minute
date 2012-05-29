class AddReportLinkToEvent < ActiveRecord::Migration
  def change
    add_column :events, :report_link, :string
  end
end
