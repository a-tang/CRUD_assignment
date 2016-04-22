class ReviewsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
before_action :find_product
before_action :find_and_authorize_review, only: :destroy

  def create
      @product          = Product.find params[:product_id]
      review_params     = params.require(:review).permit(:stars, :body)
      @review           = Review.new review_params
      @review.product   = @product
      @review.user      = current_user
      if @review.save
        redirect_to product_path(@product)
        flash[:notice]  = "Thank you for the review"
      else
        flash[:alert]   = "Not saved"
        render "/products/show"
      end
    end

    def destroy
        @review.destroy
        redirect_to product_path(product), notice: "Review deleted!"
    end

    private

    def find_product
      @product = Product.find params[:product_id]
    end

    def find_and_authorize_review
      redirect_to home_path unless can? :destroy, @review
  # head will stop the HTTP request and send a response code depending on the
  # symbole (first argument) that you pass in.
  # head :unauthorized unless can? :destroy, @review
      @review = @product.reviews.find params[:id]
    end
  end
