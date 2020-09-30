class Item < ApplicationRecord
  belongs_to :user
  has_many :wearing_times, dependent: :destroy

  validates :name, presence: true, length: { maximum: 10 }
  validates :category, presence: true
  validates :color, presence: true
  validates :scene, presence: true
  validates :purchased_at, presence: true

  has_one_attached :image

  enum category: { トップス: 1, アウター: 2, パンツ: 3, シューズ: 4 }
  enum color: { レッド: 1, オレンジ: 2, イエロー: 3, グリーン: 4, ブルー: 5,
                パープル: 6, ブラウン: 7, ブラック: 8, ホワイト: 9, その他: 10 }
  enum scene: { ビジネス: 1, プライベート: 2, スポーツ: 3 }

  def image_url
    image.attached? ? Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true) : nil
  end

  scope :search, ->(term) { where('LOWER(name) LIKE ?', "%#{term}%") }
end
