module Admin
  class JobsController < Admin::ResourceController

    private

    def permitted_params
      %i[name]
    end
  end
end

