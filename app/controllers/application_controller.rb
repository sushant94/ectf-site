class ApplicationController < ActionController::Base
# Prevent CSRF attacks by raising an exception.
# For APIs, you may want to use :null_session instead.
protect_from_forgery with: :null_session

before_action :configure_permitted_parameters, if: :devise_controller?

protected

def authenticate_user!
    redirect_to :new_user_session unless user_signed_in?
end

def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :teamName
    devise_parameter_sanitizer.for(:sign_up) << :newTeam
    devise_parameter_sanitizer.for(:sign_in) << :teamName
    devise_parameter_sanitizer.for(:sign_up) << :organization
end

def after_sign_in_path_for(resource)
    '/dashboard'
end

end
