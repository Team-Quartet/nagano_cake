class Admins::OrdersController < ApplicationController
    before_action :authenticate_admin!

  def index
    if params[:id] # 会員詳細から来た場合
      @orders = Customer.find(params[:id]).orders.page(params[:page]).per(10)
    elsif request.fullpath.include? "today" # TOPの当日注文数から来た場合
      @orders = Order.where(created_at:  Time.zone.now.all_day).page(params[:page]).per(10)
    else
      @orders = Order.page(params[:page]).per(10)
    end
  end

    def show
      @order = Order.find(params[:id])
      @order_items = @order.order_items.all
    end

    def update
     @order = Order.find(params[:id])
     if @order.update(order_params)
      redirect_to admins_orders_path, notice: 'ユーザ情報を更新しました。'
    else
      render 'show'
      @customer = @order.customer
      @order_items = @order.order_items.all
      #@order_item = OrderItem.find(@order.id)
    end
  end


  private
  def order_params
   params.permit(:customer_id, :shipping_fee, :total_price, :payment_method, :receiver_name, :postal_code, :address).merge(status: params[:order][:status].to_i)
 end

 def order_item_params
    params.require(:order_item).permit(:making_status, :count)
  end
end