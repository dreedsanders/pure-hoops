class AddTeamToGameCards < ActiveRecord::Migration[6.1]
  def change
    add_reference :game_cards, :team, null: false, foreign_key: true
  end
end
