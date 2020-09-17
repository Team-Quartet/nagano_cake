class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart = @item.cart_items.build
  end

  private

  def item_params
    params.require(:item).permit(:name, :non_taxed_price, :genre_id, :image_id)
  end



end
