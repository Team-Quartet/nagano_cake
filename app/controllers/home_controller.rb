class HomeController < ApplicationController
  def top
  	@genres = Genre.all.where(is_active: true)
  	@items = Item.all.page(params[:page]).per(3)
  end

  def about
  end
end
