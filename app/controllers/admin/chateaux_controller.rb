class Admin::ChateauxController < Admin::ApplicationController
  before_action :load, only: [:edit, :update, :destroy]
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

  private

  def load
    @chateau = Chateau.find(params[:id])
  end

  def chateau_params
    params.require(:chateau).permit(:name, :created_at, :thumb, :thumb_delete, :banner, :banner_delete, images: [])
  end
end
