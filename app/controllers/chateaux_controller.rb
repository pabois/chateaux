class ChateauxController < ApplicationController

  def index
    @chateaux = Chateau.ordered
  end

  def show
    @chateau = Chateau.find(params[:id])
  end

end
