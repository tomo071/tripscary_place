class Information < ApplicationRecord

  belongs_to :user
  belongs_to :country, optional: true

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :title, presence: true, length: { minimum: 3}
  validates :body, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true


  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end


  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  
end
