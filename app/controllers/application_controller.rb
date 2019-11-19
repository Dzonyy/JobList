class ApplicationController < ActionController::Base
  helper_method :current_user
  # layout :configure_layout

  # def configure_layout
  #   if resource_name == :employee
  #     'login'
  #   else
  #     'application'
  #   end
  # end
  def query_param?
    params[:s].present?
  end

  def query_param
    "/%#{params[:s]}%"
  end

  def after_sign_up_path_for(resource)
    my_account_path
  end

  def back_path(default = '/')
    request.headers["X-XHR-Referer"] || request.referer || default
  end
end
