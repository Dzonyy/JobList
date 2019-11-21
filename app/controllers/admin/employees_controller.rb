module Admin
  class EmployeesController < ResourceController
    # load_and_authorize_resource

    private

    def permitted_params
      %i[
        email first_name last_name role
        password password_confirmation phone_number
      ]
    end

    # cleaning empty password attributes
    def resource_params
      object_params = super

      if object_params[:password].blank?
        object_params.delete(:password)
        if object_params[:password_confirmation].blank?
          object_params.delete(:password_confirmation)

          if action_name == 'create'
            object_params[:password] = Devise.friendly_token[0, 20]
            object_params[:password_confirmation] = object_params[:password]
          end
        end
      end
      object_params
    end
  end
end
