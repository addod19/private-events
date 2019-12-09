# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Your account was created successfully'
      redirect_to @user
    else
      flash[:danger] = 'User was not created'
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @upcoming_events = @user.attended_events.upcoming
    @past_events = @user.attended_events.past
  end

  def index
    @users = User.all.order(id: :asc)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
