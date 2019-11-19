module Admin
  class ApplicationController < ::ApplicationController
    # before_action :authenticate_employee!
    # skip_before_action :load_basket
    
    # layout :set_layout
    
    private

    # def set_layout
    #   if request.xhr?
    #     false
    #   else
    #     'admin'
    #   end
    # end

    def query_param?
      params[:s].present?
    end

    def query_param(param = :s)
      "%#{params[param]}%"
    end
    
    def current_ability
      @current_ability ||= Ability.new(current_employee)
    end
  end
end
