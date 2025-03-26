class AddPhotoToPlayers < ActiveRecord::Migration[6.1]
  def change
    add_column :players, :photo, :string
  end
end
