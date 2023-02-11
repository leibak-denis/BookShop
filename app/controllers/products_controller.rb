class ProductsController < ApplicationController

  def index
    @products = collection
  end

  def new
    @product = Product.new
  end

  def show
    @product = resource
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    end
  end

  private
  def collection
    Product.ordered
  end

  def resource
    collection.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, :position, :category_id)
  end
end
