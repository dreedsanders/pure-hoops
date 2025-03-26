class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :bank, :integer
    add_column :users, :photo, :string
  end
end
