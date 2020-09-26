class Admins::OrderItemsController < ApplicationController

  def update
  	 @order_item = OrderItem.find(params[:id])
     @order_item.update(order_item_params)
     redirect_to admins_orders_path
  end

  private
  def order_item_params
    params.require(:order_item).permit(:item_id, :order_id, :amount, :taxted_price).merge(making_status: params[:order_item][:making_status].to_i)
  end
end
