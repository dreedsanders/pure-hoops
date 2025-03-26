class AddDetailsToPlayers < ActiveRecord::Migration[6.1]
  def change
    add_column :players, :value, :integer
    add_column :players, :cost, :integer
  end
end
