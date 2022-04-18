class Event < ApplicationRecord
  belongs_to :user

  validates :title, :description, :location, :start_date, :end_date, presence: true

  # trix
  has_rich_text :description

  has_one_attached :photo, dependent: :destroy
  validates :photo, content_type: [:png, :jpg, :jpeg], size: { less_than: 1.megabytes, message: 'is too large' }

  has_many :comments, dependent: :destroy
  has_many :enrollments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  def self.search(search)
    if search
      where(["title LIKE :search OR description LIKE :search", search: "%#{search}%"])
    else
      all
    end
  end
end
