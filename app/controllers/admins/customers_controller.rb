class Admins::CustomersController < ApplicationController
	before_action :authenticate_admin!
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
     @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admins_customer_path(@customer)
    else
      render :edit
    end
  end

    private
  def customer_params
    params.require(:customer).permit(:family_name, :first_name, :kana_first_name, :kana_family_name, :postal_code, :address, :phone_number, :is_deleted, :email)
  end

end