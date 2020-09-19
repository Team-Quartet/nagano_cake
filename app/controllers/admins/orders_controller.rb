class Admins::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    #@order = Order.find(params[:id])
  end

  def update
  end

	  private
	def order_params
	  params.require(:order).permit(:customer_id, :shipping_fee, :total_price, :payment_method, :status, :receiver_name, :postal_code, :address)
	end
end