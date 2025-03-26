json.extract! player, :id, :name, :position, :jersey, :height, :weight, :created_at, :updated_at
json.url player_url(player, format: :json)
