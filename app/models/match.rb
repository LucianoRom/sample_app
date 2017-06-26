class Match < ApplicationRecord
  has_many :adversaires, dependent: :destroy
  has_many :juries, dependent: :destroy
  has_many :arbitres, dependent: :destroy
  has_many :mcs, dependent: :destroy
  has_many :musiques, dependent: :destroy
  belongs_to :organisateur, class_name: 'User', foreign_key: 'orga'
validates :date, presence: true
validates :orga, presence: true
end
