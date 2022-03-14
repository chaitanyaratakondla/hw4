class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.where({ email: params["email"] })[0]
    if @user
      if BCrypt::Password.new(@user.password) == params["password"]
        session[:user_id] = @user.id
        flash[:notice] = "Welcome."
        redirect_to "/places"
      else
        flash[:notice] = "Please check"
        redirect_to "/sessions/new"
      end
    else
      flash[:notice] = "Please check"
      redirect_to "/sessions/new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = "Thank you!"
    redirect_to "/sessions/new"
  end
end
