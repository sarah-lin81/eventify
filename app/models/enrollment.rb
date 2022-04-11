class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :name, :email, presence: true
end