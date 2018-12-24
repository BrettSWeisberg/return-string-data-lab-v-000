class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def index
    @products = Product.all
  end

  def create
    @product = Product.new(products_params)
    if @product.save
      redirect_to products_path
    else
      render new_product
    end
  end

  def description
    @product = Product.find(params[:id])
    render plain: @product.description
  end

  def inventory
    @product = Product.find(params[:id])
    if @product.inventory != 0
      render plain: "true"
    else
    render plain:  "false"
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private
  def products_params
     params.require(:product).permit(:name, :price, :description, :inventory)
  end
end
