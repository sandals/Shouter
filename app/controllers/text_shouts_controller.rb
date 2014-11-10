class TextShoutsController < ApplicationController
	def create
		content = build_content
		shout = current_user.shouts.new(content: content)
		if !shout.save
			flash.alert = "Could not shout."
		end
		redirect_to dashboard_path
	end

	private
	
	def build_content
		TextShout.new(text_shout_parameters)
	end

	def text_shout_parameters
		params.require(:text_shout).permit(:body)
	end
end
