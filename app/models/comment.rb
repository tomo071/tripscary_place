class Comment < ApplicationRecord

  belongs_to :information
  belongs_to :user

  has_many :reports, dependent: :destroy

  validates :body, presence: true

  def reported_by?(user)
    reports.exists?(user_id: user.id)
  end

end
