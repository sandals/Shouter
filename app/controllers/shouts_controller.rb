class ShoutsController < ApplicationController
	def show
		@shout = Shout.find(params[:id])
	end

	def create
		shout = current_user.shouts.new(shout_paramaters)
		if !shout.save
			flash.alert = "Could not shout."
		end
		redirect_to dashboard_path
	end

	private

	def shout_paramaters
		params.require(:shout).permit(:body)
	end
end
