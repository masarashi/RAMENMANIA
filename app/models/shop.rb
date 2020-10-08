class Shop < ApplicationRecord

  include JpPrefecture
  jp_prefecture :prefecture_code
  
  has_many :menus, dependent: :destroy
  has_many :reviews, dependent: :destroy
  belongs_to :user, dependent: :destroy

  validates :name, presence: true, length: { maximum: 64 }
  # validates :pref, length: { maximum: 16 }
  validates :address, length: { maximum: 256 }
  validates :phone, length: { maximum: 16 }
  validates :description, length: { maximum: 512 }

  has_one_attached :image
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png], message: "must be a valid image format" },
                    size: { less_than: 5.megabytes, message: "should be less than 5MB" }
                                  
  def display_image
    image.variant(resize_to_limit: [300, 300])
  end

  def avg_score
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f
    else
      0.0
    end
  end

  def score_percentage
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f * 100 / 5
    else
      0.0
    end
  end
end
