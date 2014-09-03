class CreateDailyReports < ActiveRecord::Migration
  def change
    create_table :daily_reports do |t|
      t.integer :client_id
      t.integer :price

      t.timestamps
    end
  end
end
