class CartController < ApplicationController

  def show; end

  def add
    product = Product.find(params[:id])
    amount = params[:amount].to_i

    if user_signed_in?
      if @cart.cart_products.exists?(product_id: product.id)
        @cart.cart_products.create(product_id: product.id, amount: amount)
      end

      # respond_to do |format|
      #   format.turbo_stream do
      #     render turbo_stream: [turbo_stream.replace('cart',
      #                                                 partial: 'cart/cart',
      #                                                 locals: { cart: current_user.cart }),
      #                           turbo_stream.replace(product)]
      #   end
      # end

    else
      @cart[product.id] = 1
    end
  end

  def remove
    if user_signed_in?
      resource.destroy

        # respond_to do |format|
        #   format.turbo_stream do
        #     render turbo_stream: turbo_stream.replace('cart', partial: 'cart/cart', locals: { cart: current_user.cart })
        #   end
        # end

    else
      @cart.delete(params[:id].to_s)
    end
  end

  def resource
    CartProduct.find(params[:id])
  end
end
