FactoryGirl.define do
  factory :cat do
    pet_name "Madison"
    date_of_birth "2001-10-12"

    factory :registered_cat do
      registered_name "Askari Dashin Bit O' Stuff"
      registration_number "LH1234"
    end

    factory :deceased_cat do
      date_of_death "2015-05-21"
    end
  end

end
