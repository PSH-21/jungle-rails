class ReviewsController < ApplicationController

  before_filter :authorize

  def create
    @product = Product.find(params["product_id"])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:success] = 'Your review was added!'
      redirect_to product_path(@product)
    else
      flash[:error]=@review.errors.full_messages
    end
  end

  def destroy
    @review = Review.find(params["id"])
    if @review.destroy
      flash[:success] = 'The review was deleted!'
    else
      flash[:error]=@review.errors.full_messages
    end
    @product = Product.find(params["product_id"])
    redirect_to product_path(@product)
  end

private

  def review_params
    params.require(:review).permit(:rating, :description).merge(user: current_user)
  end

end




