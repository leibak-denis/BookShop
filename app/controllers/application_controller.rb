class ApplicationController < ActionController::Base
  before_action :load_cart

  def load_cart
    if user_signed_in?
      @cart = current_user.cart
    elsif session[:cart].present?
      @cart_products = Product.find(session[:cart].keys)
      @cart = session[:cart]
    else
      session[:cart] = {}
      @cart = session[:cart]
    end
  end
end
