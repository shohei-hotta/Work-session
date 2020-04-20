class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to blogs_url, notice: "ログインしました。"
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to new_session_url, notice: "ログアウトしました。"
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
