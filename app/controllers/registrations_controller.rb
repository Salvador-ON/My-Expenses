class RegistrationsController < Devise::RegistrationsController 

	private

	def sign_up_params 
		params.require(:user).permit(:email, :password, :password_confirmation, :avatar)
	end

	def acount_update_params 
		params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :avatar)
  end
  
  def after_sign_up_path_for(resource)
    '/an/example/path' # Or :prefix_to_your_route
  end

end