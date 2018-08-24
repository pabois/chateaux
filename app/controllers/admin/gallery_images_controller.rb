class Admin::GalleryImagesController < Admin::ApplicationController

  def create
    image = GalleryImage.new(chateau_id: params[:chateau_id], file: params[:file])
    if image.valid?
      image.save
      render json: { id: image.id }, status: :ok
    else
      render json: { error: "#{image.errors.first[0].capitalize} : #{image.errors.first[1].capitalize}" }, status: 412
    end
  end

  def show
    @gallery_image = GalleryImage.find(params[:id])
  end
end
