class CreateGalleryImage < ActiveRecord::Migration[5.2]
  def change
    create_table :gallery_images do |t|
      t.integer :position
    end
  end
end
