module Admin
  class CategoriesController < ResourceController
    load_and_authorize_resource

    def index
      @categories = Category.all

      render json: @categories
    end

    private

    def permitted_params
      %i[name]
    end
  end
end

