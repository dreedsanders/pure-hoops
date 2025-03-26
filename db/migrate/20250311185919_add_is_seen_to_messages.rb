class AddIsSeenToMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :is_seen, :boolean
  end
end
