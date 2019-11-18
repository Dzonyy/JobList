module Admin
  class JobsController < ResourceController

    private

    def permitted_params
      %i[:name]
    end
  end
end