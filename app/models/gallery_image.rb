# == Schema Information
#
# Table name: gallery_images
#
#  id         :bigint(8)        not null, primary key
#  position   :integer
#  chateau_id :bigint(8)
#

class GalleryImage < ApplicationRecord

  belongs_to :chateau

  has_one_attached :file

  before_create :set_position

  validate :correct_file_mime_type

  scope :ordered, -> { order(position: :asc) }


  private

  def set_position
    last = chateau.gallery_images.ordered&.last
    self.position = last.nil? ? 1 : last.position + 1
  end

  def correct_file_mime_type
    if file.attached? && !file.content_type.in?(%w(image/gif image/jpg image/jpeg image/png))
      errors.add(:file, 'Juste des images')
    end
  end

end
