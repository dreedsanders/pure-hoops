class AddIsSeenToLikes < ActiveRecord::Migration[6.1]
  def change
    add_column :likes, :is_seen, :boolean
  end
end
