json.extract! team, :id, :name, :tournament_id, :status, :created_at, :updated_at
json.url team_url(team, format: :json)
