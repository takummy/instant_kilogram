class Picture < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy

  validates :image, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate :image_size

  mount_uploader :image, ImageUploader

  private
    def image_size
      if image.size > 5.megabytes
        errors.add(:image, "のサイズが5MBを超えています。")
      end
    end
end