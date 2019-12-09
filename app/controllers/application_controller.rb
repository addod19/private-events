# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def signed_in?
    !current_user.nil?
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  def index
    @events = Event.all
    @upcoming = Event.upcoming
    @past = Event.past
  end
end
