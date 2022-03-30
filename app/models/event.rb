class Event < ApplicationRecord
  belongs_to :user

  validates :title, :description, :location, :start_date, :end_date, presence: true
end