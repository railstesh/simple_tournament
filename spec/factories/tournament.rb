FactoryBot.define do
  factory :tournament do
    status { 'upcoming' }
    sequence(:name) { |n| "tournament-#{n}" }

    trait :running do
      status { :running }
    end

    trait :finished do
      status { :finished }
    end
  end
end
