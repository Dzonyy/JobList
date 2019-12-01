module Admin
  class JobsController < ResourceController
    load_and_authorize_resource

    private

    def permitted_params
      %i[name]
    end
  end
end

