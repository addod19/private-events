class SessionsController < ApplicationController
  
  def new
    redirect_to root_url if signed_in? 
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user
      # Log the user in and redirect to the user's show page.
      flash[:success] = 'Thank you for signing in!'
      sign_in @user
      remember @user
      redirect_to user_url(@user[:id])
    else
      # Create an error message.
      flash[:error] = 'Can not verify your email of password'
      render 'new'
    end
  end

  def show
  end

  def destroy
    sign_out if signed_in?
    redirect_to root_path
  end

end
