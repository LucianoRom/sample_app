class Api < ApplicationRecord
  validates :api_name, presence: true
  validates :address, presence: true
end
