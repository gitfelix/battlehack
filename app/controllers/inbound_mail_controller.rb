class InboundMailController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def receive
    exif = EXIFR::JPEG.new(params[:attachment1].tempfile.path)

    thing = Thing.create!(
      name: params[:subject],
      image: params[:attachment1],
      lat: exif.gps.latitude,
      lng: exif.gps.longitude
    )
  end
end
