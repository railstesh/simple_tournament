FactoryBot.define do
  factory :role do
    trait :user do
      name { 'user' }
    end
  end
end
