class ApplicationController < ActionController::Base
  layout :configure_layout

  def configure_layout
    if devise_controller? && resource_name == :employee
      'login'
    else
      'application'
    end
  end

  def query_param?
    params[:s].present?
  end

  def query_param
    "/%#{params[:s]}%"
  end

  def after_sign_up_path_for(_resource)
    my_account_path
  end

  def back_path(default = '/')
    request.headers['X-XHR-Referer'] || request.referer || default
  end
end
