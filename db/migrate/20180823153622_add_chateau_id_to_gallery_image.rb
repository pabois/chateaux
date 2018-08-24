class AddChateauIdToGalleryImage < ActiveRecord::Migration[5.2]
  def change
    add_reference :gallery_images, :chateau
  end
end
