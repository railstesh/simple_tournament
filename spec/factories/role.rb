FactoryBot.define do
  factory :role do
    trait :user do
      name { 'user' }
    end

    trait :admin do
      name { 'admin' }
    end
  end
end
