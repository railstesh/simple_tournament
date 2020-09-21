FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@test.com" }
    password { 'password-123' }

    after(:build) do |_role, _evaluator|
      create(:role, :user)
    end
  end
end
