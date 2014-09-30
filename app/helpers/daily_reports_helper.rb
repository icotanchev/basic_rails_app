module DailyReportsHelper

	def doctor_users
		User.where(role: 'doctor').to_a
	end
end
