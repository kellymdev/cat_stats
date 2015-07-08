class Breed < ActiveRecord::Base
  has_many :cats

  validates :breed_name, presence: true
end
