class Space < ActiveRecord::base
  belongs_to :office
  has_many :reviews

end
