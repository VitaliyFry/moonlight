# == Schema Information
#
# Table name: equipment_items
#
#  id                 :integer          not null, primary key
#  name               :string
#  category_id        :integer
#  attack             :integer          default(0)
#  defense            :integer          default(0)
#  hp                 :integer          default(0)
#  required_level     :integer          default(1)
#  price              :integer
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  artifact           :boolean          default(FALSE)
#

class Equipment::Item < ApplicationRecord

  belongs_to :category, class_name: 'Equipment::Category', foreign_key: 'category_id'

  has_attached_file :image, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :name, :category_id, :required_level, :price, presence: true

  def sell_price
    self.artifact? ? price : price * 0.9
  end

  scope :artifacts, -> { where(artifact: true) }
  scope :not_artifact, -> { where(artifact: false) }
end
