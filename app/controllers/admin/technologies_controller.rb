module Admin
  class TechnologiesController < ResourceController
    load_and_authorize_resource

    private

    def permitted_params
      %i[name color icon]
    end
  end
end

