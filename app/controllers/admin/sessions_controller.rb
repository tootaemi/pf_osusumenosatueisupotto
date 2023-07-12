class Admin::SessionsController < Devise::SessionsController
  skip_before_action :method_name, raise: false

  # skip_before_action :login_required
  def new
  end

  # def create
  #   user = User.find_by(email:session_params[:email])

  #   if user&.authenticate(session_params[:password])
  #     session[:user_id] = user.id
  #     redirect_to root_path, notice: 'ログインしました。'
  #   else
  #     render :new
  #   end
  # end
  
  
  
  def after_sign_in_path_for(resource)
    admin_root_path
  end

  def after_sign_out_path_for(resource)
    new_admin_session_path
  end
  
  

  def destroy
    reset_session
    redirect_to root_path, notice: 'ログアウトしました。'
  end


private
  def session_params
    params.require(:session).permit(:email,:password)
  end
end
