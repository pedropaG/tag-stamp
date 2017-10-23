class UsersController < ApplicationController

	def edit
	end

	def update
		if !current_user.update(user_params)
			flash[:error] = current_user.errors.to_a.join("\n")
		else
			flash[:now] = t(:successfully_saved)
		end
		redirect_to root_path
	end

	private

	def user_params
		params.require(:user).permit(User.permit_columns)
	end

end
