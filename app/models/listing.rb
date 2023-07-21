# frozen_string_literal: true

class Listing < ApplicationRecord
  has_many :booking_photos
  has_many :listing_photos

  accepts_nested_attributes_for :listing_photos, allow_destroy: true

  def no_of_bookings
    bookings.count
  end
end
