class EnrollmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_event, only: [:new, :create]
  before_action :find_enrollment, only: [:destroy]

  def new
    @enrollment = @event.enrollments.new
  end

  def create
    @enrollment = @event.enrollments.new(enrollment_params)
    if @enrollment.save
      redirect_to @event, notice: "You're registered for #{@event.title}."
    else
      render :new
    end
  end

  def destroy
    @enrollment.destroy
    redirect_to users_enrollments_path
  end

  private
  def enrollment_params
    params.require(:enrollment).permit(:name, :email).merge(user_id: current_user.id)
  end

  def find_event
    @event = Event.find(params[:event_id])
  end

  def find_enrollment
    @enrollment = Enrollment.find(params[:id])
  end
end
