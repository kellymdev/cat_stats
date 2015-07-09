class Gender < ActiveRecord::Base
  has_many :cats

  validates :gender, presence: true
end
