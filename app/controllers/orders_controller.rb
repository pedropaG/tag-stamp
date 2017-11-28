class OrdersController < ApplicationController

	def update
		@record = Order.find params[:id]
                @record = set_order_attributes(@record, params[:record])
                @record.save
		respond_to do |format|
			format.js
			format.html{ redirect_to root_path }
		end
	end

	def toggle_printed
		@record = Order.find params[:id]
		@record.toggle_printed!
		respond_to do |format|
			format.js { head }
			format.html{ redirect_to root_path }
		end
	end


        protected

        def set_order_attributes(record, new_attributes)
          new_attributes.each do |name, value|
            record.send("#{name}=", value) 
          end
          record
        end
end
