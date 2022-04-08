class RegistrationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_event, only: [:new, :create]
  before_action :find_registration, only: [:destroy]

  def new
    @registration = @event.registrations.new
  end

  def create
    @registration = @event.registrations.new(registration_params)
    if @registration.save
      redirect_to @event, notice: "You're registered for #{@event.title}."
    else
      render :new
    end
  end

  def destroy
    @registration.destroy
    redirect_to users_registrations_path
  end

  private
  def registration_params
    params.require(:registration).permit(:name, :email, :mobile).merge(user_id: current_user.id)
  end

  def find_event
    @event = Event.find(params[:event_id])
  end

  def find_registration
    @registration = Registration.find(params[:id])
  end
end
