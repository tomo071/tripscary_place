class Information < ApplicationRecord

  belongs_to :user
  belongs_to :country, optional: true

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end


  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
