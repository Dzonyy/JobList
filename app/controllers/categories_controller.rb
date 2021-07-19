class CategoriesController < ApplicationController
  def index
    @categories = Category.all

    render json: @categories
  end

  private

  def permitted_params
    %i[name]
  end
end

