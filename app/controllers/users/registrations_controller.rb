class Users::RegistrationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @registrations = current_user.registrations.order(created_at: :desc)
  end
end