class ProductsController < ApplicationController

before_action :authenticate_user!, except: [:index, :show]
before_action(:find_product, {only: [:show, :edit, :update, :destroy]})

 #oiginal controllers
  def new
    @product = Product.new
  end

  def create
    product_params = params.require(:product).permit([:title, :description, :price, :category_id])
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      flash[:notice] = "Product created!"
      redirect_to product_path(@product)
    else
      flash[:alert] = "Didn't save product!"
      render :new
    end
  end

  def show
    @product = Product.find params[:id]
    @review = Review.new

  end

  def index
    @products = Product.all
  end

  def edit
    @product = Product.find params[:id]
  end

  def update
    @product  = Product.find params[:id]
    product_params = params.require(:product).permit([:title, :description, :price])
    if @product.update product_params
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find params[:id]
    @product.destroy
    redirect_to products_path
  end
end

private

def product_params
  product_params = params.require(:product).permit([:title, :description])
end

def find_product
  @product = Product.find params[:id]
end
#   def new
#     @product = Product.new
#   end
#
#   def create
#     @product = Product.new
#   end
#
# end
