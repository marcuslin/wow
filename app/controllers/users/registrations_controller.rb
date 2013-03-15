class Users::RegistrationsController < Devise::RegistrationsController
  protected
  def after_sign_up_path_for(resource)
    new_character_user_path(current_user)
  end
end