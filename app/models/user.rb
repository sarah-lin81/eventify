class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar, dependent: :destroy

  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :registrations, dependent: :destroy

  def name
    email.split("@")[0]
  end
end
