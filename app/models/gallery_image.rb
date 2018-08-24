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

  scope :ordered, -> { order(position: :asc) }

  private

  def set_position
    last = chateau.gallery_images.ordered&.last
    self.position = last.nil? ? 1 : last.position + 1
  end

end
