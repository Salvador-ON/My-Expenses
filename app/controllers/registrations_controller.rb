class RegistrationsController < Devise::RegistrationsController 

	private

	def sign_up_params 
		params.require(:user).permit(:email, :password, :password_confirmation, :avatar)
	end

	def acount_update_params 
		params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :avatar)
  end
  
  def after_sign_up_path_for(resource)
    #Group.new(user_id:1, name:'Not assigned', group_id:1, icon: 'fa-times')
    '/profile' # Or :prefix_to_your_route
  end

  def after_sign_in_path_for(resource)
    '/profile' # Or :prefix_to_your_route
  end

end