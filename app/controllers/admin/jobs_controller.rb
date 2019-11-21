module Admin
  class JobsController < ResourceController
    
    # def index
    #   @jobs = Job.all
    # end

    private

    def permitted_params
      %i[name]
    end
  end
end

