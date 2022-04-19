class Users::FavoriteEventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorite_events = current_user.favorite_events.order(created_at: :desc)
  end
end
