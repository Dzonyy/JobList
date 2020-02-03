module Admin
  class JobsController < ResourceController
    load_and_authorize_resource

    private

    def permitted_params
      %i[name category_id pricing_id salary_from salary_to experience company_name] +
        [job_technologies_attributes: %i[name rating]]
    end
  end
end
