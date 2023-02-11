class CategoriesController < ApplicationController

  def index
    @categories = collection
  end


  def show
    @category = resource
    @products = Product.where(category_id: params[:id])
  end

  private
  def collection
    Category.ordered
  end

  def resource
    collection.find(params[:id])
  end

end
