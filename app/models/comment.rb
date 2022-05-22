class Comment < ApplicationRecord
  belongs_to :information
  belongs_to :user
  
  has_many :favorites, dependent: :destroy
end
