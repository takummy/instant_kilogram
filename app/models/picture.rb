class Picture < ApplicationRecord
  belongs_to :user

  validates :image, presence: true
  validates :content, length: { maximum: 140 }

  mount_uploader :image, ImageUploader
end
