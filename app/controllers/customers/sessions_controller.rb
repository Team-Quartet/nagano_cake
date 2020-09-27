# frozen_string_literal: true

class Customers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  before_action :reject_customer, only: [:create]

  protected

  def active_for_authentication?
    
    super && (self.is_deleted == false)
  end

  def reject_customer
    @customers = Customer.where(is_deleted: true)
    @customer = @customers.find_by(email: params[:customer][:email].downcase)

    if @customer
      if (@customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == true))
        flash[:error] = "※退会済みです。"
        redirect_to new_customer_session_path
      end
    else
      flash[:error] = "※メールアドレスとパスワードが一致しません。"
    end
  end
end
