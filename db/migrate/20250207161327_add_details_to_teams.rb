class AddDetailsToTeams < ActiveRecord::Migration[6.1]
  def change
    add_column :teams, :attribute_level, :integer
  end
end
