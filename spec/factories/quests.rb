FactoryBot.define do
  factory :quest do
    sequence(:name) { |n| "Quest #{n}" }
    status { false }

    trait :completed do
      status { true }
    end
  end
end
