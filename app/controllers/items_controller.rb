class ItemsController < ApplicationController
  def index
    @genres = Genre.all.where(is_active: true)
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @items = Item.where(genre_id: params[:genre_id]).page(params[:page]).per(8)
    else
      @items = Item.all.page(params[:page]).per(8)
    end
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  private

  def item_params
    params.require(:item).permit(:name, :non_taxed_price, :genre_id, :image_id)
  end



end
