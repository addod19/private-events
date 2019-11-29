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
        # @events holds the events attended by the user
        @events = @user.events.paginate(page: params[:page])
        @upcoming = @events.select { |d| d.date > Date.today.to_s }
        @past = @events.select { |d| d.date < Date.today.to_s }
        # @created holds the events created by the user
        @created = Event.all
    end

    def upcoming_events
        @current_date = Date.today.to_s
        @upcoming = @current_user.date < @events.date


    end

    def past_events?
        @current_date = Date.today.to_s
        @past = @current_user.date > @events.date
    end

    private

        def user_params
            params.require(:user).permit(:name, :email)
        end
end
