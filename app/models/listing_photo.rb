# frozen_string_literal: true

class ListingPhoto < ApplicationRecord
  include ImageUploader::Attachment(:image)

  validates :image, presence: true
end
