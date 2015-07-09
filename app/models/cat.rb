class Cat < ActiveRecord::Base
  belongs_to :breed
  belongs_to :coat_colour
  belongs_to :title

  validates :pet_name, presence: true
  validates :date_of_birth, presence: true

  def registered?
    self.registration_number != nil && self.registered_name.length > 1
  end

  def deceased?
    self.date_of_death != nil
  end

  def has_title?
    self.title != nil
  end
end
