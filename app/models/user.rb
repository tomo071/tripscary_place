class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :password, presence: true, on: :create
  validates :name, uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments
  has_many :informations
  has_many :favorites, dependent: :destroy
  has_many :current_locations, dependent: :destroy


end