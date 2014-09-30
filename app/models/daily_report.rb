class DailyReport < ActiveRecord::Base
	belongs_to :user

	validates :user_id, presence: true
	validates :daily_report, presence: true
	validates :price, presence: true
  
	serialize :daily_report
end
