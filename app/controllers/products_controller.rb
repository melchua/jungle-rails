class ProductsController < ApplicationController
  helper_method :sold_out?

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
  end

  def sold_out? p
    if p.quantity == 0
      true
    end
  end


end
