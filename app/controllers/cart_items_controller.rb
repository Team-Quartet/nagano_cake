class CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
  end

  def show
  end

  def create
  end

  def destroy
  end

  def update
  end

  def destroy_all
  end
end
