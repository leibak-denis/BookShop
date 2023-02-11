class CartController < ApplicationController

  def show; end

  def add
    product = Product.find(params[:id])
    amount = params[:amount].to_i

    if user_signed_in?
      if @cart.cart_products.exists?(product_id: product.id)
        @cart.cart_products.update(product_id: product.id, amount: amount)
      else
        @cart.cart_products.create(product_id: product.id, amount: amount)
      end

      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [turbo_stream.replace('cart',
                                                      partial: 'cart/cart',
                                                      locals: { cart: current_user.cart }),
                                turbo_stream.replace(product)]
        end
      end
    else

      unless @cart.key?(product.id)
        @cart[product.id] = 1
      end

    end
  end

  def remove
    if user_signed_in?
      CartProduct.find_by(id: params[:id]).destroy
        respond_to do |format|
          format.turbo_stream do
            render turbo_stream: turbo_stream.replace('cart', partial: 'cart/cart', locals: { cart: current_user.cart })
          end
        end
    else
      @cart.delete(params[:id].to_s)
    end
  end

  # def increment
  # end

  # def decrement
  # end
end
