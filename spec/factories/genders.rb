FactoryGirl.define do
  factory :gender do
    sequence(:gender) { |n| "Neuter#{n}" }
  end
end
