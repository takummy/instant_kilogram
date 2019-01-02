class Picture < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy

  validates :image, presence: true
  validates :content, length: { maximum: 140 }

  mount_uploader :image, ImageUploader
end
