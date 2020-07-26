class EventsController < ApplicationController


    def index
        @events = Event.all
    end
    
    def show
        @event = Event.find(params[:id])    
    end

    def new
        @event = Event.new
    end

    def create
        @event = current_user.created_events.create(event_params)

        if @event.save
            flash[:success] = "Event created successfully!"
            redirect_to event_path(@event)
        else
            flash[:error] = "Event could not be created"
            render 'new'
        end
    end

 
    

    private
    def event_params
        params.require(:event).permit(:event_date, :event_name, :event_description, :location)
    end

end
