class AddGoatToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :goat, :string
  end
end
