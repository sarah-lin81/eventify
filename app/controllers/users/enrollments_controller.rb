class Users::EnrollmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @enrollments = current_user.enrollments.order(created_at: :desc)
  end
end