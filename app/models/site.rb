class Site < ActiveRecord::Base
  #belongs_to :user
  #belongs_to :city
  has_many :spaces
  has_many :facilities
  has_many :amenities, through: :facilities
end
