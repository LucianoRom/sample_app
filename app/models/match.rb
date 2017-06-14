class Match < ApplicationRecord
  has_many :adversaires, dependent: :destroy
  has_many :juries, dependent: :destroy
  has_many :arbitres, dependent: :destroy
  has_many :mcs, dependent: :destroy
  has_many :musiques, dependet: :destroy
  validates :date, presence: true
end
