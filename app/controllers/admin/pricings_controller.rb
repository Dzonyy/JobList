module Admin
  class PricingsController < ResourceController
    load_and_authorize_resource

    private

    def permitted_params
      %i[name price description]
    end
  end
end
