class Space < ActiveRecord::Base
  belongs_to :site
  has_many :reviews
  has_many :photos
  # has_many :amenities
  mount_uploader :image, ImageUploader
end
