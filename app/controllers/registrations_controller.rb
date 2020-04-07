class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :avatar, :name)
  end

  def acount_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :avatar, :name)
  end

  def after_sign_up_path_for(_resource)
    '/profile'
  end

  def after_sign_in_path_for(_resource)
    '/profile'
  end
end
