class Amenity < ActiveRecord::Base
has_many :facilities
has_many :sites, through: :facilities
# belongs_to :site
# belongs_to :spaces
end
