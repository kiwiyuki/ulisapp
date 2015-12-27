class Admin::EventsController < ApplicationController
    before_action :set_event, only: [:show, :edit, :update, :destroy]
    
    # GET admin/events
    # GET admin/events.json
    def index
        @events = Event.all.order('event_date desc')
    end
    
    # GET admin/events/1
    # GET admin/events/1.json
    def show
    end
    
    # GET admin/events/new
    def new
        @event = Event.new
    end
    
    # GET admin/events/1/edit
    def edit
    end
    
    # POST admin/events
    # POST admin/events.json
    def create
        @event = Event.new(event_params)
        if @event.save
            redirect_to admin_event_path(@event), notice: 'Event was successfully created.'
        else
            render action: 'new'
        end
    end
    
    # PATCH/PUT admin/events/1
    # PATCH/PUT admin/events/1.json
    def update
        if @event.update(event_params)
            redirect_to admin_event_path(@event), notice: 'Event was successfully updated.'
        else
            render action: 'edit'
        end
    end
    
    # DELETE admin/events/1
    # DELETE admin/events/1.json
    def destroy
        @event.destroy
        redirect_to admin_events_url
    end
    
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
        @event = Event.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
        params.require(:event).permit(:event_name, :event_date, :summary)
    end
end
