class FavouritesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_create, only: :create
  before_action :authorize_destroy, only: :destroy
#
#     def create
#       product           = Product.find params[:product_id]
#       favourite         = Favourite.new
#       favourite.user    = current_user
#       favourite.product = product
#       if  favourite.save
#       redirect_to product, notice: "Faved!"
#     else
#       redirect_to product, alert: "You already faved the product"
#     end
#   end
#
#   def destroy
#     product = Product.find params[:product_id]
#     favourite = Favourite.find params[:id]
#     favourite.destroy
#     redirect_to product, notice: "Un-faved!"
#   end
# end
def create
    favourite          = Favourite.new
    favourite.user     = current_user
    favourite.product = product
    if favourite.save
      redirect_to product, notice: "Favourited!"
    else
      redirect_to product, alert: "You're already favourited!"
    end
  end

  def destroy
    favourite.destroy
    redirect_to product_path(favourite.product_id), notice: "Un-favourited!"
  end

  private

  def authorize_create
    redirect_to product, notice: "Can't favourite!" unless can? :favourite, product
  end

  def authorize_destroy
    redirect_to product, notice: "Can't remove favourite!" unless can? :destroy, favourite
  end

  def product
    @product ||= Product.find params[:product_id]
  end

  def favourite
    @favourite ||= Favourite.find params[:id]
  end
end
