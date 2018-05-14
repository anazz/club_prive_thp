class ApplicationController < ActionController::Base

	before_action :sanitize_devise_params, if: :devise_controller?

	# def configure_devise_parameters

	# 	devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation)}

	# end	

	def sanitize_devise_params
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name])
  	end
	
end
