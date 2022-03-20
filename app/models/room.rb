class Room < ApplicationRecord
  mount_uploader :image_name, ImageNameUploader
  belongs_to :user
  has_many :reservations
  validates :name, {presence: true}
  validates :introduction, {presence: true}
  validates :price, {presence: true}
  validates :address_building, {presence: true}
  validates :image_name, {presence: true}
end
