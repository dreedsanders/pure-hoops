class CreateGameCards < ActiveRecord::Migration[6.1]
  def change
    create_table :game_cards do |t|
      t.string :location
      t.integer :default_rating

      t.timestamps
    end
  end
end
