module TagsHelper

	def month
		Date.today.month
	end

	def year
		Date.today.year
	end

	def real_column(number)
		(number % current_user.columns).to_i + 1
	end
end
