class Event < ApplicationRecord
  belongs_to :user

  validates :title, :description, :location, :start_date, :end_date, presence: true

  # trix
  has_rich_text :description

  has_one_attached :img, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :enrollments, dependent: :destroy

  def self.search(search)
    if search
      where(["title LIKE :search OR description LIKE :search", search: "%#{search}%"])
    else
      all
    end
  end
end
