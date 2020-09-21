class Admins::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_items = Order_item.all
  end

  def update
     @order = Order.find(params[:status])
    if @order.update(order_params)
      redirect_to request.referer
    else
      render 'orders/show'
    end
  end

	  private
	def order_params
	  params.require(:order).permit(:customer_id, :shipping_fee, :total_price, :payment_method, :status, :receiver_name, :postal_code, :address)
	end
end