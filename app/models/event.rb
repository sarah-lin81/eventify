class Event < ApplicationRecord
  belongs_to :user

  validates :title, :description, :location, :start_date, :end_date, presence: true

  has_one_attached :img, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :registrations, dependent: :destroy
end
