class OrdersController < ApplicationController

	def update
		@record = Order.find params[:id]
		respond_to do |format|
			format.js
			format.html{ redirect_to root_path }
		end
	end

end
