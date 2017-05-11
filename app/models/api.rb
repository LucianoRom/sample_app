class Api < ApplicationRecord
  validates :api_name, presence: true
  validates :address, presence: true
  mount_uploader :apicture, ApictureUploader

end
