class Order < ApplicationRecord

	belongs_to :user

	scope :from_user, lambda{|user| where(user: user) }
	scope :unprinted, -> { where(printed: false) }


	def full_address
		[street, street2].compact.join(" ")
	end

	def zip_and_city
		[zip_number, state].compact.join(", ")
	end	

	def state_and_country
		[state, country].compact.join(", ")
	end

end
