class ReviewsController < ApplicationController
  def create
    @product = Product.find params[:product_id]
    review = Review.new(review_params)
    review.product_id = params[:product_id]
    review.user_id = current_user.id
      if review.save
        redirect_to :back
      else
        redirect_to :back
      end
  end
  private
    def review_params
      params.require(:review).permit(:rating, :description)
    end
end
