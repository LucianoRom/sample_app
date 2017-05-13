
class Api < ApplicationRecord
  validates :api_name, presence: true
  validates :address, presence: true
  validates :apicture, presence: true
  mount_uploader :apicture, ApictureUploader
  validate :apicture_size

  private

  # Validates the size of an uploaded picture.
  def apicture_size
    if apicture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
