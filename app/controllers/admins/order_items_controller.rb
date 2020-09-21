class Admins::OrderItemsController < ApplicationController
	before_action :authenticate_admin!

  def update
  	 @order_item = Order_item.find(params[:making_status])
    if @order_item.update(order_item_params)
      redirect_to request.referer
    else
      render 'orders/show'
    end
  end

  def order_item_params
    params.require(:order_item).permit(:item_id, :order_id, :count, :taxted_price, :making_status)
  end
end
