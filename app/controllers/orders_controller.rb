class OrdersController < ApplicationController
  def index
    @orders = current_customer.orders
  end

  def create
    if current_customer.cart_items.exists?
      @order = Order.new(order_params)
      @order.customer_id = current_customer.id
      @order.status = 0
      @order.save
      current_customer.cart_items.each do |cart_item|
      @order_item = OrderItem.new
      @order_item.order_id = @order.id
      @order_item.item_id = cart_item.item_id
      @order_item.taxed_price = cart_item.item.non_taxed_price
      @order_item.count = cart_item.count
      @order_item.save
      cart_item.destroy
    end
    @address_select = params[:address_select]
      if @address_select == "新しいお届け先"
         @shipping_address = ShippingAddress.new
         @shipping_address.customer_id = current_customer.id
         @shipping_address.postal_code = @order.postal_code
         @shipping_address.address = @order.address
         @shipping_address.receiver_name = @order.receiver_name
         @shipping_address.save
      end
    end
    redirect_to orders_thanks_path
  end

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: @order.id).includes(:item)
    if @order.customer_id == current_customer.id
    else
        redirect_to orders_path
    end
  end

  def new
    @cart_items = CartItem.where(customer_id: current_customer.id)
    if @cart_items.empty?
        redirect_to cart_items_path
    else
        @order = Order.new
        @customer = Customer.find_by(id: current_customer.id)
        @shipping_addresses = ShippingAddress.where(customer_id: current_customer.id)
    end
  end

  def confirm
    @order = Order.new(order_params)
    @customer = Customer.find_by(id: current_customer.id)
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @address_select = params[:address_select]
    @order.shipping_fee = 800
    @order.payment_method = params[:order][:payment_method]
    if @address_select == "ご自身の住所"
        @order.postal_code = @customer.postal_code
        @order.address = @customer.address
        @order.receiver_name = @customer.family_name + @customer.first_name
    elsif @address_select == "登録済住所から選択"
        @shipping_address = ShippingAddress.find(params[:order][:id])
        @order.postal_code = @shipping_address.postal_code
        @order.address = @shipping_address.address
        @order.receiver_name = @shipping_address.receiver_name
    else
        @order.postal_code = params[:new_postal_code]
        @order.address = params[:new_address]
        @order.receiver_name = params[:new_receiver_name]
    end
  end

  def thanks
  end


private
def order_params
      params.require(:order).permit(:created_at, :postal_code, :address, :receiver_name, :payment_method, :shipping_fee, :total_price, :status,
      order_items_attributes: [:order_id, :item_id, :count, :taxed_price, :making_status])
end

end
