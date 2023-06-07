# frozen_string_literal: true

class Customer::SessionsController < Devise::SessionsController
  # def guest_sign_in
  #   user = User.guest
  #   sign_in user
  #   redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  # end

  # before_action :configure_sign_in_params, only: [:create]

  # ログイン後のリダイレクト先
  # def after_sign_in_path_for(resource_or_scope)
  #   root_path(resource)
  # end

  # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end


  def new_guest
    customer = Customer.guest
    sign_in customer
    redirect_to root_path, notice: "ゲストユーザーとしてログインしました"
  end


  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    p '-------create-----'
    p params
    p configure_sign_in_params
    p '------------'
    super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end
end
