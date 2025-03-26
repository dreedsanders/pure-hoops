json.extract! game_card, :id, :location, :default_rating, :created_at, :updated_at
json.url game_card_url(game_card, format: :json)
