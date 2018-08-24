class Admin::GalleryImagesController < Admin::ApplicationController

  def create
    image = GalleryImage.new(chateau_id: params[:chateau_id], file: params[:file])
    if image.valid?
      image.save
      render json: { }, status: :ok
    else
      render json: { error: "Une erreur est survenue" }, status: 412
    end
  end
end
