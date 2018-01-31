class Space < ActiveRecord::Base
  belongs_to :site
  has_many :reviews

end
