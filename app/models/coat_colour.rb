class CoatColour < ActiveRecord::Base
  has_many :cats

  validates :colour, presence: true
end
