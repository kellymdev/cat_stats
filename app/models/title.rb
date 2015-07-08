class Title < ActiveRecord::Base
  has_many :cats

  validates :title, presence: true
end
