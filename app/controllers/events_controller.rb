class EventsController < ApplicationController
  before_action :find_event, except: [:index, :new, :create]

  def index
    @events = Event.order(created_at: :desc).search(params[:search])
  end

  def new
    @event = current_user.events.new
  end

  def create
    @event = current_user.events.new(event_params)
    if @event.save
      redirect_to events_path, notice: "Successfully created!"
    else
      render :new
    end
  end

  def show
    @comment = @event.comments.new
    @comments = @event.comments.order(created_at: :desc)  
  end

  def edit    
  end

  def update
    if @event.update(event_params)
      redirect_to events_path, notice: "Successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: "Successfully deleted!"
  end

  private
  def event_params
    params.require(:event).permit(:title, :description, :location, :start_date, :end_date, :img)
  end

  def find_event
    @event = Event.find(params[:id])
  end
end
