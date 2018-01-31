class City < ActiveRecord::base
belongs_to :country
has_many :sites
end
