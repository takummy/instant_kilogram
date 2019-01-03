class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pictures
  has_many :favorites, dependent: :destroy
  has_many :favorite_pictures, through: :favorites, source: :picture

  validates :name, presence: true, length: { maximum: 30 }

  mount_uploader :icon, IconUploader
end
