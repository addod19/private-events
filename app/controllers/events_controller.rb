# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    @events = Event.all
    @upcoming = Event.upcoming
    @past = Event.past
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = 'Your account was created successfully'
      redirect_to @event
    else
      flash[:danger] = 'User was not created'
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @creator = User.find(@event.user_id)
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :date, :description, :user_id)
  end
end
