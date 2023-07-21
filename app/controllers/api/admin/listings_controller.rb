# frozen_string_literal: true

class Api::Admin::ListingsController < ApplicationController
  before_action :authorize_request

  def index
    render json: listings_builder
  end

  def create
    listing = Listing.new(permitted_params)
    if listing.save
      render json: listing
    else
      render json: { error: listing.errors.full_messages }
    end
  end

  private

  def listings_builder
    collection = []
    Listing.all.each do |listing|
      collection << listing.attributes.merge({ photos: listing.listing_photos.map(&:image_url) })
    end
    collection
  end

  def permitted_params
    params.require(:listing).permit(
      :name,
      :grade,
      :fees,
      :description,
      listing_photos_attributes: %i[id image _destroy]
    )
  end
end
