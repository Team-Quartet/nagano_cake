class CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customer_path(current_customer.id), notice: "登録情報を編集しました"
    else
      render :edit
    end
  end

  def unsubscribe
    @customer = Customer.find(current_customer.id)
  end

  def withdrawl
    @customer = Customer.find(current_customer.id)
    reset_session
    @customer.destroy
    redirect_to root_path, notice: "退会しました"
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:family_name, :first_name, :kana_family_name, :kana_first_name, :email, :postal_code, :address, :phone_number)
  end
end
