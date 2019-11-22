module Admin
  class JobsController < ResourceController
    load_and_authorize_resource
    # def index
    #   @jobs = Job.all
    # end

    private

    def permitted_params
      %i[name]
    end
  end
end

