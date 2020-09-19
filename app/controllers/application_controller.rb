class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
	  case resource
	  when Admin
	    admins_home_top_path
	  when Customer
	    home_top_path
	  end
	end

	protected
  def configure_permitted_parameters
    added_attrs = [:email, :password, :family_name, :kana_family_name, :first_name, :kana_first_name, :postal_code, :address, :phone_number]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end
end
