class Office < ActiveRecord::base
  belongs_to :user
  belongs_to :city
  has_many :spaces

end
