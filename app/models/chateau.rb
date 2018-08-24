# == Schema Information
#
# Table name: chateaux
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Chateau < ApplicationRecord

  has_one_attached_deletable :thumb
  has_one_attached_deletable :banner
  has_many :gallery_images

  accepts_nested_attributes_for :gallery_images

  scope :ordered, -> { order(created_at: :desc) }

  # Validations
  validates :name, :created_at, :thumb, :banner, presence: true

  def to_s
    name
  end

end
