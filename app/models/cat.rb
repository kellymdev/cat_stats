class Cat < ActiveRecord::Base
  validates :pet_name, presence: true
  validates :registration_number, uniqueness: true
  validates :date_of_birth, presence: true
end
