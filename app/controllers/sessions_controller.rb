class SessionsController < ApplicationController

  skip_before_action :authenticate_user!, only: %i[new create]

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:before_login_path] || root_path, notice: 'Successfully logged in!'
    else
      render :new, alert: 'SOMETHING IN UR DATA IS INCORRECT!'
    end
  end

  def destroy
    session.delete(:user_id)
    cookies.delete(:before_login_path)
    redirect_to root_path, notice: "come back when you're a little mmmmmm more guru"
  end

end
