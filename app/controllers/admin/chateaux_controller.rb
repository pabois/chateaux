class Admin::ChateauxController < Admin::ApplicationController
  before_action :load, only: [:edit, :update, :destroy, :update_images]
  add_breadcrumb 'Châteaux', :admin_chateaux_path

  def index
    @chateaux = Chateau.ordered
  end

  def new
    @chateau = Chateau.new(created_at: Time.now)
    add_breadcrumb 'Nouveau Château'
  end

  def edit
    add_breadcrumb @chateau
  end

  def create
    @chateau = Chateau.new(chateau_params)
    if @chateau.save
      redirect_to admin_chateaux_path, notice: 'Le château a bien été créé.'
    else
      render :new
      add_breadcrumb 'Nouveau Château'
    end
  end

  def update
    if @chateau.update chateau_params
      redirect_to admin_chateaux_path, notice: 'Le château a bien été modifié.'
    else
      render :edit
      add_breadcrumb @chateau
    end
  end

  def destroy
    @chateau.destroy
    redirect_to admin_chateaux_path, notice: 'Le château a bien été détruit.'
  end

  def update_images
    ids = []
    params[:image_ids].each.with_index do |id, index|
      id = id.to_i # json format -> string
      ids << id
      @chateau.gallery_images.find(id).update_column(:position, index + 1)
    end unless params[:image_ids].nil?
    @chateau.gallery_images.where.not(id: ids).destroy_all
  end

  private

  def load
    @chateau = Chateau.find(params[:id])
  end

  def chateau_params
    params.require(:chateau).permit(:name, :created_at, :thumb, :thumb_delete, :banner, :banner_delete, gallery_images_attributes: [:image, :position])
  end
end
