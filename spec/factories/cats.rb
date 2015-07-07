FactoryGirl.define do
  factory :cat do
    pet_name "Madison"
    registered_name "Askari Dashin Bit O' Stuff"
    registration_number "LH1234"
    date_of_birth "2001-10-12"

    factory :deceased_cat do
      date_of_death "2015-05-21"
    end
  end

end
