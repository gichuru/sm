class Space < ActiveRecord::Base
  belongs_to :site
  has_many :reviews
  # has_many :amenities
end
