class Admins::CustomersController < ApplicationController
	before_action :authenticate_admin!
  def index
    @customers = Customer.all
  end

  def show
  end

  def edit
  end

  def update
  end

    private
  def customer_params
    params.require(:customer).permit(:family_name, :first_name, :kana_first_name, :kana_family_name, :postal_code, :address, :phone_number, :is_deleted)
  end

end