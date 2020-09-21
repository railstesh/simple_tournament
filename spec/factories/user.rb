FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@test.com" }
    password { 'password-123' }

    transient do
      roles { 'user' }
    end

    after(:build) do |_user, _evaluator|
      create(:role, :user)
      create(:role, :admin)
    end
  end
end
