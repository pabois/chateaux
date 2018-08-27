class ChateauxController < ApplicationController

  def index
    @chateaux = Chateau.ordered
  end

  def show
    @chateau = Chateau.find(params[:id])

    chateaux = Chateau.ordered
    current_index = 0
    chateaux.each.with_index do |chateau, index|
      current_index = index if chateau.id = params[:id]
    end
    @prev = current_index < chateaux.length ? chateaux[current_index + 1] : nil
    @next = current_index > 0 ? chateaux[current_index - 1] : nil
  end

end
