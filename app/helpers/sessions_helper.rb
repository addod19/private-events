# frozen_string_literal: true

module SessionsHelper
  def current_user?(user)
    user == current_user
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find(user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find(user_id)
      if user&.authenticate(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def signed_in?
    !current_user.nil?
  end

  def remember(user)
    cookies.permanent.signed[:user_id] = user.id
  end

  def forget(_user)
    cookies.delete(:user_id)
  end
end
