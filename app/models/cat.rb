class Cat < ActiveRecord::Base
  belongs_to :breed
  belongs_to :coat_colour
  belongs_to :title
  belongs_to :gender

  validates :pet_name, presence: true
  validates :date_of_birth, presence: true

  def registered?
    registration_number != nil && registered_name.length > 1
  end

  def deceased?
    date_of_death != nil
  end

  def has_title?
    title != nil
  end
end