class Article < ApplicationRecord
  has_one_attached :cover_image

  enum :status, [ :draft, :waiting_for_review, :published ]
end
