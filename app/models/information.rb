class Information < ApplicationRecord

  belongs_to :user
  belongs_to :country, optional: true

  has_many :comments, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
