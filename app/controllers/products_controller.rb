class ProductsController < ApplicationController
  # helper_method :sold_out?

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
  end

end
