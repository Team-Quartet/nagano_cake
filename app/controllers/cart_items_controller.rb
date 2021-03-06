class CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
  end

  def create
    @cart_item = current_customer.cart_items.build(cart_item_params)
    @current_item = CartItem.find_by(item_id: @cart_item.item_id,customer_id: @cart_item.customer_id)
    if @current_item.nil?
      if @cart_item.save
        flash[:success] = 'カートに商品が追加されました！'
        redirect_to cart_items_path
      else
        @carts_items = @customer.cart_items.all
        render 'index'
        flash[:danger] = 'カートに商品を追加できませんでした。'
      end
    else
      @current_item.count += params[:count].to_i
      @current_item.update(cart_item_params)
      redirect_to cart_items_path
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
    flash[:info] = 'カートの商品を取り消しました。'
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path
      flash[:success] = 'カート内の商品を更新しました！'
    end
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
    flash[:info] = 'カートを空にしました。'
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :count)
  end
end
