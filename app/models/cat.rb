class Cat < ActiveRecord::Base
  belongs_to :breed

  validates :pet_name, presence: true
  validates :date_of_birth, presence: true

  def registered?
    self.registration_number != nil && self.registered_name != nil
  end

  def deceased?
    self.date_of_death != nil
  end
end
