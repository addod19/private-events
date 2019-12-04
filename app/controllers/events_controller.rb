# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    @events = Event.all
    @upcoming = Event.upcoming.order(date: :asc)
    @past = Event.past
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = 'Your event was created successfully'
      redirect_to @event
    else
      flash[:danger] = 'Event was not created'
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @creator = User.find(@event.user_id)
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :description, :date)
  end
end
