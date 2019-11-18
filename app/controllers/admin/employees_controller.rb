module Admin
  class EmployeesController < ResourceController

    private

    def permitted_params
      %i[:email :password]
    end
  end
end