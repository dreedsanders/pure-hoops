class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.string :jersey
      t.string :height
      t.string :weight

      t.timestamps
    end
  end
end
