# frozen_string_literal: true

class BookingPhoto < ApplicationRecord
  include ImageUploader::Attachment(:image) # adds an `image` virtual attribute
end
