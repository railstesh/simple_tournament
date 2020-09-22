FactoryBot.define do
  factory :team do
    sequence(:name) { |n| "team-#{n}" }
    status { 'pending' }
    tournament

    trait :approved do
      status { :approved }
    end

    trait :rejected do
      status { :rejected }
    end

    transient do
      team_players_count { 1 }
    end

    after(:create) do |team, evaluator|
      create_list(:team_player, evaluator.team_players_count, team: team)
    end
  end
end
