class ReviewsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]

  def create
      @product          = Product.find params[:product_id]
      review_params     = params.require(:review).permit(:stars, :body)
      @review           = Review.new review_params
      @review.product   = @product
      @answer.user      = current_user
      if @review.save
        redirect_to product_path(@product)
        flash[:notice]  = "Thank you for the review"
      else
        flash[:alert]   = "Not saved"
        render "/products/show"
      end
    end

    def destroy
        product     = Product.find params[:product_id]
        review      = product.reviews.find params[:id]
        review.destroy
        redirect_to product_path(product), notice: "Review deleted!"
    end

  end
