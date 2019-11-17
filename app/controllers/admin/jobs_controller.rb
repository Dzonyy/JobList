module Admin
  class JobsController < ResourceController
    def index
    end

    private

    def permitted_params
      [:name]
    end
  end
end