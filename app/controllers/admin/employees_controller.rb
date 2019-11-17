module Admin
  class EmployeesController < ::Admin::ApplicationController
    def index
      @employees = Employee.all
    end
  end
end