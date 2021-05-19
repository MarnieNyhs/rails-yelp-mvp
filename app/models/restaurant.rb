class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :category, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"] }

  def ratings_average
    reviews.present? ? reviews.map(&:rating).sum / reviews.length : 0
  end
end
