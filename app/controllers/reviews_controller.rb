class ReviewsController < ApplicationController
  before_action :require_login
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

  def destroy
    @product = Product.find params[:product_id]
    del_review = @product.reviews.find(params[:id])
    del_review.destroy
    if del_review.save
      redirect_to :back
    else
      redirect_to :back
    end
  end


  private
    def review_params
      params.require(:review).permit(:rating, :description)
    end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_path # halts request cycle
    end
  end

  def logged_in?
    current_user
  end

end
