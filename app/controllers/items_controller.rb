class ItemsController < ApplicationController
  def index
    # @items = Item.all.page(params[:page]).per(8)
    @items = Item.where(is_active: true).page(params[:page]).per(8)
    @genres = Genre.where(is_active: true)
    # @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.where(is_active: true)
    # @genres = Genre.all
  end

  private

  def item_params
    params.require(:item).permit(:name, :non_taxed_price, :genre_id, :image_id)
  end



end
