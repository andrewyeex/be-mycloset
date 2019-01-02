class Clothing < ApplicationRecord
  validates_uniqueness_of :image
end
