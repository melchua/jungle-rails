class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      # cookie stuff
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to new_session_path
    end
  end

  def destroy
    session.delete(:user_id)
    # session[:user_id] = nil
    redirect_to new_session_path
  end

end
