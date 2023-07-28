# frozen_string_literal: true

class Api::Admin::ListingsController < ApplicationController
  before_action :authorize_request

  def index
    render json: listings_builder
  end

  def create
    new_listing = Listing.new(permitted_params)
    if new_listing.save
      render json: new_listing.attributes.merge({ photos: photos_builder(new_listing) })
    else
      render json: { error: new_listing.errors.full_messages }
    end
  end

  def update
    if listing.update(permitted_params)
      render json: listing.attributes.merge({ photos: photos_builder(listing) })
    else
      render json: { error: listing.errors.full_messages }
    end
  end

  private

  def listings_builder
    collection = []
    Listing.all.each do |listing|
      collection << listing.attributes.merge({ photos: photos_builder(listing) })
    end
    collection
  end

  def photos_builder(listing)
    listing.listing_photos.order(created_at: :desc).map { |photo| { id: photo[:id], url: photo.image_url } }
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

  def listing
    @listing ||= Listing.find(params[:id])
  end
end
