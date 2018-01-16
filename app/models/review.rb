class Review < ActiveRecord::base
  belongs_to :space
  belongs_to :user
end
