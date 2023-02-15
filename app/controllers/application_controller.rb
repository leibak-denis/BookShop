class ApplicationController < ActionController::Base
  before_action :load_cart

  def load_cart
    @cart = if user_signed_in?
      current_user.cart
    elsif session[:cart].present?
      @cart_products = Product.find(session[:cart].keys)
      session[:cart]
    else
      session[:cart] = {}
      session[:cart]
    end
  end

end
