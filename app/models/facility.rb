class Facility < ActiveRecord::Base
belongs_to :site
belongs_to :amenities
end
