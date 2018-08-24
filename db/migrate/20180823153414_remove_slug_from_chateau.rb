class RemoveSlugFromChateau < ActiveRecord::Migration[5.2]
  def change
    remove_column :chateaux, :slug
  end
end
