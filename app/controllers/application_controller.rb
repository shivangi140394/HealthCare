class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  # def after_sign_in_path_for(resource)
  #   if resource.role == 'patient'
  #     patients_path(resource)
  #   elsif resource.role == 'therapist'
  #     therapists_path
  #   else
  #     dashboard_index_path
  #   end
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :role)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :role)}
  end

  def current_login_user
    @current_patient = Patient.find_by_user_id(current_user.id)
    @current_therapist = Therapist.find_by_user_id(current_user.id)
  end
end

