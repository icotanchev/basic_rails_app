class ChangeDailyReport < ActiveRecord::Migration
  def self.up
  	remove_column :daily_reports, :client_id
    remove_column :daily_reports, :price
    
    add_column :daily_reports, :daily_report, :text
    add_column :daily_reports, :user_id, :integer
    add_column :daily_reports, :price, :string

    add_index :daily_reports, :user_id
  end

  def self.down
  	add_column :daily_reports, :client_id, :integer

    remove_column :daily_reports, :price
    add_column :daily_reports, :price, :integer

  	remove_column :daily_reports, :daily_report, :text
    remove_column :daily_reports, :user_id, :integer
  end
end
