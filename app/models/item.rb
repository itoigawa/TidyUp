class Item < ApplicationRecord
  validates :name, presence: true

  has_one_attached :image

  enum category: { tops: 1, outor: 2, pants: 3, shoes: 4 }
  enum color: { red: 1, orange: 2, yellow: 3, green: 4, blue: 5, purple: 6, brawn: 7, black: 8, white: 9 }
  enum scene: { business: 1, everyday: 2, sports: 3 }
  
  def image_url
    image.attached? ? Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true) : nil
  end
end
