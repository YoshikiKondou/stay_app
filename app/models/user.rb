class User < ApplicationRecord
  mount_uploader :image_name, ImageNameUploader
  has_many :rooms
  has_secure_password
  validates :name,  {presence: true}
  validates :email, {presence: true, uniqueness: true}
  validates :password, presence: true, length: { minimum: 6 }, on: :create
end
